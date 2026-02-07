{
  pkgs,
  inputs,
  config,
  ...
}:
{
  programs.doom-emacs = {
    enable = true;
    doomDir = ./doom.d;
    doomLocalDir = "${config.xdg.dataHome}/nix-doom";
    emacs = pkgs.emacs;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
    extraBinPackages = with pkgs; [
      git
      ripgrep
      fd
    ];
    provideEmacs = true;
  };

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    gnutls
    cmake
    nixfmt
    grip
    graphviz
    glslang
    python3Packages.pyflakes
    python3Packages.pytest

    python3

    # Org -> Typst (native exporter uses this CLI)
    typst

    cmigemo
    pipenv
    python3Packages.nose2

    (pkgs.writeShellScriptBin "nosetests" ''
      exec ${pkgs.python3Packages.nose2}/bin/nose2 "$@"
    '')

    (stdenvNoCC.mkDerivation rec {
      pname = "moralerspace";
      version = "2.0.0";
      src = fetchzip {
        url = "https://github.com/yuru7/moralerspace/releases/download/v${version}/MoralerspaceHW_v${version}.zip";
        hash = "sha256-gd195o0acZL8AhGvcLLQYxd1VWvUYjpVRMOT5D7zDME=";
      };
      installPhase = ''
        mkdir -p $out/share/fonts/truetype
        cp *.ttf $out/share/fonts/truetype/
      '';
    })
  ];

}
