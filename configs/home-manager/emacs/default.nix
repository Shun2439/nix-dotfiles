{ pkgs, inputs, config, ... }:
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

  home.packages = with pkgs; [
    gnutls
  ];

}
  


