{
  pkgs,
  ...
}:
{
  imports = [
    ../waybar # use noctalia
    ../fuzzel
    ../mako # use noctalia
  ];

  home.packages = with pkgs; [
    tlp

    # fuzzel
    # swaylock
    # swaylock-effects # use noctalia
    # swaybg # wallpaper
    # wlogout
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
}
