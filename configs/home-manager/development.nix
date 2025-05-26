{pkgs, ...}:
{
  home.packages = with pkgs; [
    vscode

    gdb
    gef

    # bun
    deno # denops

    # rust-bin.stable.latest.default

    ruby
  ];
}

