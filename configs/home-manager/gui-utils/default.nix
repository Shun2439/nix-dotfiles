{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pcmanfm
    ranger
    nautilus

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
    affine

    lmms
    tuxguitar

    (pkgs.symlinkJoin {
      name = "musescore-wayland";
      paths = [ musescore ];
      nativeBuildInputs = [ makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/mscore \
          --set MU_QT_QPA_PLATFORM wayland \
          --set QT_QPA_PLATFORM wayland
      '';
    })

    obs-studio

    # Discord 1.0.146 はネイティブ Wayland だとスプラッシュで止まるため、
    # NIXOS_OZONE_WL を外して XWayland (xwayland-satellite) 経由の X11 で動かす。
    (pkgs.symlinkJoin {
      name = "discord-x11";
      paths = [ pkgs.discord ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/discord --unset NIXOS_OZONE_WL
        wrapProgram $out/bin/Discord --unset NIXOS_OZONE_WL
      '';
    })

    anki
  ];
}
