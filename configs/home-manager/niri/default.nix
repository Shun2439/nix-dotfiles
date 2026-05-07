{ config, pkgs, inputs, ... }: 
{
  imports = [
    ../waybar
    ../fuzzel
  ];

  home.packages = with pkgs; [
    tlp

    # fuzzel
    swaylock
    mako
    swaybg
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}

