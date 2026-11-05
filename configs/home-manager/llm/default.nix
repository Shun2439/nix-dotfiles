{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  # llama.cpp 0.7.0+ tolerates unanchored JSON Schema `pattern` values that AI
  # clients (opencode, Zed) put in their tool definitions. Pull it from a newer
  # nixpkgs so the rest of the system stays on the pinned one.
  llamaPkgs = inputs.nixpkgs-llama.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  # llama.cpp built with the Vulkan backend so the Intel iGPU (Iris Xe) is used.
  # Without a usable Vulkan device it silently falls back to CPU.
  llama = llamaPkgs.llama-cpp.override { vulkanSupport = true; };

  modelDir = "${config.home.homeDirectory}/models/gguf";
  modelFile = "Qwen3-4B-Instruct-2507-Q4_K_M.gguf";
  defaultModel = "${modelDir}/${modelFile}";
  alias = "qwen3-4b";

  # Shared with the systemd unit and the llm-serve wrapper.
  serverArgs = [
    "--host"
    "127.0.0.1"
    "--port"
    "8080"
    "--n-gpu-layers"
    "99"
    # Flash attention is ~3x faster on this iGPU but hangs the i915 driver
    # ("GPU HANG ... context reset") with the default ubatch of 512. 128 is stable
    # for long (7k+ token) prompts.
    "--flash-attn"
    "on"
    "--batch-size"
    "512"
    "--ubatch-size"
    "128"
    "--ctx-size"
    "8192"
    "--threads"
    "4"
    # One slot keeps the KV cache at 1x ctx instead of 4x (~2GB saved).
    "--parallel"
    "1"
    "--jinja"
    "--alias"
    alias
  ];

  llm-pull = pkgs.writeShellApplication {
    name = "llm-pull";
    runtimeInputs = [ pkgs.curl ];
    text = ''
      repo="''${1:-unsloth/Qwen3-4B-Instruct-2507-GGUF}"
      file="''${2:-${modelFile}}"
      dest="${modelDir}/$file"

      mkdir -p "${modelDir}"
      if [ -f "$dest" ]; then
        echo "already exists: $dest"
        exit 0
      fi

      echo "downloading $repo/$file -> $dest"
      curl -fL --retry 3 -C - -o "$dest" \
        "https://huggingface.co/$repo/resolve/main/$file?download=true"
    '';
  };

  llm-serve = pkgs.writeShellApplication {
    name = "llm-serve";
    runtimeInputs = [ llama ];
    text = ''
      model="''${1:-${defaultModel}}"
      if [ ! -f "$model" ]; then
        echo "model not found: $model" >&2
        echo "run 'llm-pull' first" >&2
        exit 1
      fi

      exec llama-server -m "$model" \
        --host "''${LLM_HOST:-127.0.0.1}" \
        --port "''${LLM_PORT:-8080}" \
        --n-gpu-layers "''${LLM_GPU_LAYERS:-99}" \
        --flash-attn "''${LLM_FLASH_ATTN:-on}" \
        --batch-size "''${LLM_BATCH:-512}" \
        --ubatch-size "''${LLM_UBATCH:-128}" \
        --ctx-size "''${LLM_CTX:-8192}" \
        --threads "''${LLM_THREADS:-4}" \
        --parallel "''${LLM_PARALLEL:-1}" \
        --jinja \
        --alias "''${LLM_ALIAS:-${alias}}"
    '';
  };

  llm-status = pkgs.writeShellApplication {
    name = "llm-status";
    runtimeInputs = [
      pkgs.curl
      pkgs.jq
    ];
    text = ''
      if ! curl -sf http://127.0.0.1:8080/health >/dev/null; then
        echo "llama-server is not responding on 127.0.0.1:8080"
        echo "start it with: systemctl --user start llama-server"
        exit 1
      fi

      echo "served models:"
      curl -s http://127.0.0.1:8080/v1/models | jq -r '.data[].id' | sed 's/^/  /'

      echo "benchmark:"
      curl -s http://127.0.0.1:8080/v1/chat/completions \
        -H 'Content-Type: application/json' \
        -d '{
          "messages": [{ "role": "user", "content": "Reply with one short sentence." }],
          "max_tokens": 32,
          "stream": false
        }' |
        jq -r 'if .timings then "  \(.timings.predicted_per_second | floor) tok/s (\(.timings.predicted_n) tokens)" else "  no timings in response" end'
    '';
  };
in
{
  home.packages = [
    llama
    pkgs.vulkan-tools
    llm-pull
    llm-serve
    llm-status
  ];

  home.sessionVariables = {
    # Keep GGUF files outside the nix store (not GC managed on purpose).
    LLAMA_CACHE = modelDir;
    # Zed reads an API key even for OpenAI-compatible endpoints that ignore it.
    LLAMA_CPP_API_KEY = "sk-local";
  };

  # Ollama-style always-on server. Models are ~2.5GB so keep a single instance.
  systemd.user.services.llama-server = {
    Unit = {
      Description = "llama.cpp server (Vulkan, OpenAI compatible)";
      After = [ "network.target" ];
      StartLimitBurst = 3;
      StartLimitIntervalSec = 60;
    };
    Service = {
      ExecStart = lib.escapeShellArgs (
        [ "${llama}/bin/llama-server" ]
        ++ [
          "-m"
          defaultModel
        ]
        ++ serverArgs
      );
      Environment = [ "LLAMA_CACHE=${modelDir}" ];
      Restart = "on-failure";
      RestartSec = 10;
    };
    Install.WantedBy = [ "default.target" ];
  };

  # opencode: custom OpenAI-compatible provider (v2 `providers` key).
  home.file.".config/opencode/opencode.jsonc" = {
    source = ./opencode.jsonc;
    force = true;
  };

  # Zed rewrites settings.json from its UI, so point at the repo working copy
  # instead of a read-only nix store path. Edits show up as git diffs.
  home.file.".config/zed/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/ghq/github.com/Shun2439/nix-dotfiles/configs/home-manager/llm/zed-settings.json";
    force = true;
  };
}
