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
    ../mako
  ];

  home.packages = with pkgs; [
    tlp

    # fuzzel
    # swaylock
    swaylock-effects
    swaybg # wallpaper
    wlogout
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
