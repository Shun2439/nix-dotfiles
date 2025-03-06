{pkgs, ...}:
{
  home.packages = with pkgs; [
    deno

    # rust-bin.stable.latest.default

    ruby

    gcc
    cmake
    ninja

    gdb
    gef

    flutter
    android-studio

    zed-editor
  ];
}

