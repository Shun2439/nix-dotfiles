{ config, pkgs, ... }:
{
  imports = [
    ../../configs/home-manager/cli-utils
    ../../configs/home-manager/development.nix

    ../../configs/home-manager/vim
    ../../configs/home-manager/emacs

    ../../configs/home-manager/fzf

    ../../configs/home-manager/tmux

    ../../configs/home-manager/git
    ../../configs/home-manager/lazygit

    ../../configs/home-manager/fish
    ../../configs/home-manager/starship

    ../../configs/home-manager/eza

    ../../configs/home-manager/ctf.nix
  ];

  programs.home-manager.enable = true;
}

