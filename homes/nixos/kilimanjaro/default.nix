{ ... }:
{
  imports = [
    ../../../modules/home-manager
    ../../../configs/nixos/core/nixos.nix

    # X11 (xmonad) セッション。GMA 4500 では Wayland が動かないため。
    ../../../configs/home-manager/x
    ../../../configs/home-manager/xmobar

    ../../../configs/home-manager/browser
    ../../../configs/home-manager/gui-utils
    ../../../configs/home-manager/polkit-agent
  ];
  home = rec {
    username = "shun2439";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
}
