{ pkgs, ... }:
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
    rust-analyzer

    # ruby
    # due to vscode extensions requires version manager like rbenv

    glibc
    gcc

    # Language servers for LSP support in Emacs
    typescript-language-server
    pyright
    python311Packages.python-lsp-server
    clang-tools
    ccls

    # Other LSP tools
    lua-language-server
    nil # Nix language server

    # Formatters
    black
    isort
    prettier
    nixfmt

    # Linters
    deadnix
    statix

    # Debuggers
    lldb
  ];
}
