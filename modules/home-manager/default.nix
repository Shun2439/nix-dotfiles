{ config, pkgs, ... }:
{
  imports = [
    ../../configs/nixos/core/nixos.nix
    # ../../configs/home-manager/development.nix
    ../../configs/home-manager/vim
    ../../configs/home-manager/tmux
    # ../../configs/home-manager/browser
    ../../configs/home-manager/git
    ../../configs/home-manager/wezterm
    ../../configs/home-manager/eza
    ../../configs/home-manager/fzf

    ../../configs/home-manager/xmobar
  ];

  home = rec {
    username = "shun2439";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";

    packages = with pkgs; [
      bat
      dmenu
      gmrun
      # z
    ];

    shellAliases = { # not work
      ls = "eza";
      la = "ls -al";
    };
  };
  programs.home-manager.enable = true;
}

