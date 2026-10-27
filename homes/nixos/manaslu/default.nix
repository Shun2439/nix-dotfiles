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
