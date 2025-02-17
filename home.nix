{ config, pkgs, ... }:
{
  imports = [
    ./configs/nixos.nix
    ./configs/development.nix
    ./configs/vim
    ./configs/tmux
    ./configs/browser
    ./configs/git
    ./configs/wezterm
    ./configs/eza
    ./configs/fzf
  ];

  home = rec {
    username = "demo";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";

    packages = with pkgs; [
      bat
      # z
    ];

    shellAliases = { # not work
      ls = "eza";
      la = "ls -al";
    };
  };
  programs.home-manager.enable = true;
}

