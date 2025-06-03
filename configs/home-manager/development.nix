{pkgs, ...}:
{
  home.packages = with pkgs; [
    vscode
    eclipses.eclipse-java

    gdb
    gef

    # bun
    deno # denops

    # rust-bin.stable.latest.default

    ruby
  ];
}

