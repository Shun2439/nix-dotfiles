{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver.displayManager.gdm.wayland = true;
}

