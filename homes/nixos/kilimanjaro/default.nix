{ configs, pkgs, lib, ... }:
let
  # mainMonitor = "VGA-1";
  mainMonitor = "HDMI-A-1";
  subMonitor = "LVDS-1";
in
{
  imports = [
    ../../../modules/home-manager
    ../../configs/nixos/core/nixos.nix
    ../../configs/home-manager/wezterm
    # ../../configs/home-manager/tmux
    ../../configs/home-manager/browser
    ../../configs/home-manager/hyprland
    ../../configs/home-manager/development.nix
    ../../configs/home-manager/gui-utils/default.nix
    # ../../configs/home-manager/xmobar
    # ../../configs/home-manager/x
  ];
  home = rec {
    username = "shun2439";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";
  };

  wayland.windowManager.hyprland.settings = {
    monitor = [
      # "${mainMonitor}, 1920x1080@60, 1366x0, 1"
      "${mainMonitor}, 2560x1600@60, 1366x0, 1"
      "${subMonitor}, 1366x768@60, 0x0, 1"
    ];
    input.kb_layout = "jp";
    workspace =
      (lib.genList (n: "${toString (n+1)}, monitor:${mainMonitor}") 10);
  };
}

