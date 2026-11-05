{
  pkgs,
  ...
}:
{
  imports = [
    ../../../modules/home-manager
    # ../../../configs/nixos/core/nixos.nix

    ../../../configs/home-manager/wezterm
    ../../../configs/home-manager/ghostty
    ../../../configs/home-manager/kitty

    ../../../configs/home-manager/browser
    # ../../../configs/home-manager/hyprland
    ../../../configs/home-manager/niri
    ../../../configs/home-manager/noctalia
    ../../../configs/home-manager/gui-utils
    ../../../configs/home-manager/polkit-agent
    ../../../configs/home-manager/recording

    ../../../configs/home-manager/ssh
  ];
  home = rec {
    username = "shun";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
    sessionVariables = {
      XCURSOR_SIZE = "24";
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      # Electron アプリ (discord, obsidian, ...) を Wayland ネイティブで起動する。
      # 未設定だと X11 バックエンドを選び、niri (XWayland なし) で起動に失敗する。
      NIXOS_OZONE_WL = "1";
    };
    packages = with pkgs; [
      wl-clipboard

      tailscale

      brightnessctl

      evtest

      playerctl

      rofimoji
    ];
  };
}
