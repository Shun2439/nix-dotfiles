{ pkgs, ... }:
let
  record-screen = pkgs.writeShellScriptBin "record-screen" ''
    set -euo pipefail

    notify() {
      ${pkgs.libnotify}/bin/notify-send "画面録画" "$1" || true
    }

    if pgrep -f 'gpu-screen-recorder' >/dev/null; then
      pkill -INT -f 'gpu-screen-recorder' || true
      notify "録画を停止しました"
      exit 0
    fi

    dir="$HOME/Videos/Recordings"
    mkdir -p "$dir"

    file="$dir/$(date +%Y-%m-%dT%H-%M-%S).mp4"
    log="''${XDG_RUNTIME_DIR:-/tmp}/record-screen.log"

    nohup ${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder \
      -w portal \
      -f 60 \
      -c mp4 \
      -o "$file" \
      >"$log" 2>&1 &

    pid=$!

    sleep 1
    if kill -0 "$pid" 2>/dev/null; then
      notify "録画を開始しました: $(basename "$file")"
    else
      notify "録画の開始に失敗しました。ログ: $log"
      exit 1
    fi
  '';

  record-gif = pkgs.writeShellScriptBin "record-gif" ''
    set -euo pipefail

    notify() {
      ${pkgs.libnotify}/bin/notify-send "GIF録画" "$1" || true
    }

    state_dir="''${XDG_RUNTIME_DIR:-/tmp}/record-gif"
    pid_file="$state_dir/pid"
    video="$state_dir/recording.mp4"
    log="$state_dir/log"

    if [[ -f "$pid_file" ]]; then
      pid="$(cat "$pid_file")"
      if kill -0 "$pid" 2>/dev/null &&
        [[ "$(cat "/proc/$pid/comm" 2>/dev/null || true)" == "wf-recorder" ]]; then
        kill -INT "$pid" || true
        for _ in {1..100}; do
          kill -0 "$pid" 2>/dev/null || break
          sleep 0.1
        done

        out_dir="$HOME/Pictures/Screencasts"
        mkdir -p "$out_dir"
        out="$out_dir/$(date +%Y-%m-%dT%H-%M-%S).gif"

        if ${pkgs.gifski}/bin/gifski --fps 15 -o "$out" "$video" >"$log" 2>&1; then
          notify "GIFを保存しました: $(basename "$out")"
          rm -rf "$state_dir"
        else
          notify "GIF変換に失敗しました。MP4: $video ログ: $log"
          exit 1
        fi
        exit 0
      fi
      rm -rf "$state_dir"
    fi

    region="$(${pkgs.slurp}/bin/slurp)" || exit 0
    [[ -z "$region" ]] && exit 0

    mkdir -p "$state_dir"

    nohup ${pkgs.wf-recorder}/bin/wf-recorder -g "$region" -f "$video" >"$log" 2>&1 &
    pid=$!
    printf '%s\n' "$pid" >"$pid_file"

    sleep 1
    if kill -0 "$pid" 2>/dev/null; then
      notify "GIF録画を開始しました。同じキーでもう一度押すと停止します"
    else
      notify "GIF録画の開始に失敗しました。ログ: $log"
      rm -rf "$state_dir"
      exit 1
    fi
  '';
in
{
  home.packages = with pkgs; [
    gifski
    gpu-screen-recorder
    libnotify
    record-gif
    record-screen
    slurp
    wf-recorder
  ];
}
