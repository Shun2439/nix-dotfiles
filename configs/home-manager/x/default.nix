{
  pkgs,
  ...
}:
{
  # X11 (xmonad) 用の最小構成ツール。
  # Wayland 前提の fuzzel / mako / swww / wl-clipboard などの代替。
  home.packages = with pkgs; [
    xfce4-terminal # VTE ベース。GPU を必要としない
    rofi # ランチャー (dmenu の代替)

    dunst # 通知 (mako の代替)
    libnotify
    feh # 壁紙 (swww の代替)

    xclip # wl-clipboard の代替
    clipmenu # クリップボード履歴 (cliphist の代替)

    maim # スクリーンショット (grim/slurp の代替)
    xdotool

    stalonetray # nm-applet / blueman のトレイ

    pamixer # 音量キー
    playerctl # メディアキー
    brightnessctl # 輝度キー

    xrandr
    xsetroot
  ];

  home.file = {
    ".xinitrc" = {
      target = ".xinitrc";
      source = ./.xinitrc;
      # startx が直接 exec するため実行ビットが必要
      executable = true;
    };
    ".xprofile" = {
      target = ".xprofile";
      source = ./.xprofile;
    };
  };
}
