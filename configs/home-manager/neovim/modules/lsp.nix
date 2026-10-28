# LSP configuration
{ ... }:
{
  programs.nixvim.plugins = {
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
    fidget = {
      enable = true;
      settings = {
        notification = {
          window = {
            winblend = 0;
          };
        };
        progress = {
          display.done_style = "";
        };
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd.enable = true;
        dockerls.enable = true;
        hls = {
          enable = true;
          installGhc = false;
        };
        lua_ls.enable = true;
        nixd.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
        ts_ls.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>dj" = "goto_next";
          "<leader>dk" = "goto_prev";
          "<leader>df" = "open_float";
          "<leader>dq" = "setloclist";
        };
        # `gd` / `gD` / `gi` / `gt` are provided by snacks.picker in keymaps.nix.
        lspBuf = {
          "K" = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
        };
      };
    };

    # LSP completion
    blink-cmp = {
      enable = true;
      settings = {
        appearance = {
          nerd_font_variant = "normal";
          use_nvim_cmp_as_default = true;
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution = {
                enabled = false;
              };
            };
          };
          documentation = {
            auto_show = true;
          };
          ghost_text.enabled = true;
        };
        signature = {
          enabled = true;
        };
        sources = {
          providers = {
            buffer = {
              score_offset = -7;
            };
            lsp = {
              fallbacks = [ ];
            };
          };
        };
      };
    };
  };
}
