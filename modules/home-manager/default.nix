{ config, pkgs, ... }:
{
  imports = [
    ../../configs/nixos/core/nixos.nix

    ../../configs/home-manager/development.nix

    ../../configs/home-manager/vim
    ../../configs/home-manager/fzf
    ../../configs/home-manager/git
    ../../configs/home-manager/wezterm

    ../../configs/home-manager/fish
    ../../configs/home-manager/tmux
    ../../configs/home-manager/starship
    ../../configs/home-manager/eza

    # ../../configs/home-manager/browser

    ../../configs/home-manager/xmobar
    ../../configs/home-manager/x

    ../../configs/home-manager/ctf.nix
  ];

  home = rec {
    username = "shun2439";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";

    packages = with pkgs; [
      vscode
      # eclipse
      bat
      dmenu
      gmrun
      # z
      alsa-utils
      oneko
    ];

  };
  programs.home-manager.enable = true;
}
