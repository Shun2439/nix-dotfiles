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

    # flameshot

    rpi-imager

    thunderbird

    # plasma5Packages.kdeconnect-kde
  ];
}

