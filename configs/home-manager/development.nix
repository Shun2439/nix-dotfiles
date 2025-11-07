{pkgs, ...}:
{
  home.packages = with pkgs; [
    # vscode
    # eclipses.eclipse-java

    gdb
    gef

    # bun
    deno # denops
    nodejs

    # rust-bin.stable.latest.default

    ruby

    glibc
    gcc
  ];
}

