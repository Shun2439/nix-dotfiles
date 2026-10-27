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
in
{
  home.packages = with pkgs; [
    gpu-screen-recorder
    libnotify
    record-screen
  ];
}
