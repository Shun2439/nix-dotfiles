{
  pkgs,
  ...
}:
{
  # Wayland を強制する GUI。X11 セッション (kilimanjaro) では動かないので
  # manaslu からのみ import する。
  home.packages = with pkgs; [
    freecad-wayland

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
  ];
}
