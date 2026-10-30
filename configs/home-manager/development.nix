{ pkgs, ... }:
let
  # gef の optional 依存（nixpkgs の gef ラッパが NIX_PYTHONPATH で渡しているもの）
  gefPython = pkgs.python3.withPackages (
    ps: with ps; [
      capstone
      filebytes
      keystone-engine
      ropper
      unicorn
    ]
  );
in
{
  home.packages = with pkgs; [
    vscode
    zed-editor
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
    python312Packages.python-lsp-server
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

    clojure
  ];

  # nixpkgs の gef は「gdb に -x gef.py させる」ラッパなので、
  # gdb を直接起動する経路（pwntools / エディタ / devShell 等）でも gef を効かせる
  home.file.".gdbinit".text = ''
    python
    import sys
    sys.path.insert(0, "${gefPython}/${pkgs.python3.sitePackages}")
    end
    source ${pkgs.gef}/share/gef/gef.py
  '';
}
