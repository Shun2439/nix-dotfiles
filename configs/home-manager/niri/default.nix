{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../waybar
    ../fuzzel
  ];

  home.packages = with pkgs; [
    tlp

    # fuzzel
    # swaylock
    swaylock-effects
    mako # notification
    swaybg # wallpaper
    wlogout
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
