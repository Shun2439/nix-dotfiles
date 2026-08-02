{ pkgs, ... }:
{
  home.packages = with pkgs; [
    oneko

    pcmanfm
    ranger

    loupe # image viewer
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

    kdePackages.kdeconnect-kde
    obsidian # unfree
    logseq
    tuxguitar

    obs-studio

    anki
  ];
}
