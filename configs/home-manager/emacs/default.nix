{ pkgs, config, ... }:
let
  # Bundle the dictionaries with hunspell so Emacs' ispell finds them no matter
  # how the profile's share/hunspell is wired up (the wrapper sets DICPATH).
  hunspell = pkgs.hunspellWithDicts (
    with pkgs.hunspellDicts;
    [
      en_US
      sv_SE
      ko_KR
    ]
  );
in
{
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    doomLocalDir = "${config.xdg.dataHome}/nix-doom";
    # emacs = pkgs.emacs;
    emacs = pkgs.emacs-pgtk;
    extraPackages = epkgs: [ epkgs.treesit-grammars.with-all-grammars ];
    extraBinPackages = [
      pkgs.git
      pkgs.ripgrep
      pkgs.fd
      hunspell
    ];
    provideEmacs = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    wordnet # for Thesaurus

    sqlite

    gnumake
    cargo
    rustc
    cmake

    pandoc
    gnuplot

    gnutls

    nixfmt
    graphviz
    glslang

    # Lua
    lua-language-server
    stylua
    lua5_4

    # F#
    dotnet-sdk_9
    fsautocomplete

    # Python
    python3
    pyright
    python3Packages.pyflakes
    python3Packages.pytest
    pipenv
    python3Packages.nose2

    # Java
    jdk25
    gradle

    jdt-language-server
    google-java-format

    # Org -> Typst (native exporter uses this CLI)
    typst

    cmigemo

    # Haskell
    ghc
    stack
    cabal-install
    haskell-language-server
    fourmolu
    haskellPackages.hoogle

    # TS
    typescript
    typescript-language-server

    # Go
    gopls
    gomodifytags
    gotests
    gore

    cljfmt

    symbola

    # Docker
    dockerfile-language-server
    dockfmt

    # wl-clipboard
    (pkgs.writeShellScriptBin "nosetests" ''
      exec ${pkgs.python3Packages.nose2}/bin/nose2 "$@"
    '')

    # (stdenvNoCC.mkDerivation rec {
    #   pname = "moralerspace";
    #   version = "2.0.0";
    #   src = fetchzip {
    #     url = "https://github.com/yuru7/moralerspace/releases/download/v${version}/MoralerspaceHW_v${version}.zip";
    #     hash = "sha256-gd195o0acZL8AhGvcLLQYxd1VWvUYjpVRMOT5D7zDME=";
    #   };
    #   installPhase = ''
    #     mkdir -p $out/share/fonts/truetype
    #     cp *.ttf $out/share/fonts/truetype/
    #   '';
    # })

    maxima
  ];

}
