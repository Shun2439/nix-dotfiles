{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      alsa-lib
      zstd
      zlib
      glib
      pango
      cairo
      gdk-pixbuf
      gtk3
      atk
      gst_all_1.gstreamer
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-bad
      libX11
      libxcb
      libxkbcommon
      wayland
      libgbm
      libdrm
      fontconfig
      freetype
      harfbuzz
      fribidi
      expat
      e2fsprogs
      libgpg-error
      elfutils
      gmp
      libglvnd
    ];
  };
}
