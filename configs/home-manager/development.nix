{pkgs, ...}:
{
  home.packages = with pkgs; [
    devbox
    # bun
    deno # denops

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

