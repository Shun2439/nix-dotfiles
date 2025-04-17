{ pkgs, ... }:
{
  home.packages = with pkgs; [
    oneko

    pcmanfm
    ranger

    vlc
    mpv

    shotcut
    gimp
    inkscape
    audacity

    flameshot

    rpi-imager

    wl-clipboard
  ];

  services.cliphist.enable = true;
}

