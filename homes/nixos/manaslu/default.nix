{
  configs,
  pkgs,
  lib,
  ...
}:
let
  mainMonitor = "HDMI-A-1";
  subMonitor = "LVDS-1";
in
{
  imports = [
    ../../../modules/home-manager
    # ../../../configs/nixos/core/nixos.nix
    ../../../configs/home-manager/wezterm
    ../../../configs/home-manager/ghostty
    ../../../configs/home-manager/browser
    # ../../../configs/home-manager/hyprland
    ../../../configs/home-manager/niri
    ../../../configs/home-manager/noctalia
    ../../../configs/home-manager/development.nix
    ../../../configs/home-manager/gui-utils/default.nix

    ../../../configs/home-manager/ssh
  ];
  home = rec {
    username = "shun";
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  # wayland.windowManager.hyprland.settings = {
  #   monitor = [
  #     "${mainMonitor}, 2560x1600@60, 1366x0, 1"
  #     "${subMonitor}, 1366x768@60, 0x0, 1"
  #   ];
  #   input.kb_layout = "jp";
  #   workspace =
  #     (lib.genList (n: "${toString (n+1)}, monitor:${mainMonitor}") 10);
  # };
  home = {
    sessionVariables = {
      GTK_USE_PORTAL = "1";
      XCURSOR_SIZE = "12";
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
