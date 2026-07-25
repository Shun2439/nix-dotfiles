{ pkgs, ... }:
let
  buzz-src = pkgs.fetchurl {
    url = "https://github.com/block/buzz/releases/download/v0.4.25/Buzz_0.4.25_amd64.AppImage";
    hash = "sha256-7VMiW8KjDtKdGf35ckujvUUgJ3t83xKcciU0R1CEp48=";
  };
  gstPluginsDir = "/run/current-system/sw/share/nix-ld/lib/gstreamer-1.0";
  buzz-extracted = pkgs.appimageTools.extractType2 {
    pname = "buzz-desktop";
    version = "0.4.25";
    src = buzz-src;
    postExtract = ''
      substituteInPlace $out/apprun-hooks/linuxdeploy-plugin-gtk.sh \
        --replace-fail 'export GDK_BACKEND=x11' 'unset GDK_BACKEND'
      substituteInPlace $out/AppRun \
        --replace-fail 'exec "$this_dir"/AppRun.wrapped "$@"' \
          'export GST_PLUGIN_PATH=${gstPluginsDir}
           exec "$this_dir"/AppRun.wrapped "$@"'
      rm -f $out/usr/lib/libsystemd.so.0
      rm -f $out/usr/lib/libxkbcommon*
      rm -f $out/usr/lib/libgstreamer*
      rm -f $out/usr/lib/libgst*
    '';
  };
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "buzz-desktop" ''
      export LD_LIBRARY_PATH=/run/current-system/sw/share/nix-ld/lib:$LD_LIBRARY_PATH
      cd ${buzz-extracted}
      exec ./AppRun "$@"
    '')
  ];
}
