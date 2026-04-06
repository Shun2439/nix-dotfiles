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

    kicad
    freecad-wayland

    # flameshot

    rpi-imager

    # plasma5Packages.kdeconnect-kde
  ];
}

