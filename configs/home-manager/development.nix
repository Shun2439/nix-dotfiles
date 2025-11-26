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

    # ruby
    # due to vscode extensions requires version manager like rbenv

    glibc
    gcc
  ];
}

