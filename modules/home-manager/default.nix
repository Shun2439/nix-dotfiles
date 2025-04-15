{ config, pkgs, ... }:
{
  imports = [
    ../../configs/nixos/core/nixos.nix

    ../../configs/home-manager/cli-utils/default.nix
    ../../configs/home-manager/gui-utils/default.nix

    ../../configs/home-manager/development.nix

    ../../configs/home-manager/wezterm
    ../../configs/home-manager/vim
    ../../configs/home-manager/fzf

    ../../configs/home-manager/git
    ../../configs/home-manager/lazygit

    ../../configs/home-manager/fish
    ../../configs/home-manager/tmux
    ../../configs/home-manager/starship
    ../../configs/home-manager/eza

    ../../configs/home-manager/browser

    # ../../configs/home-manager/xmobar
    # ../../configs/home-manager/x
    ../../configs/home-manager/hyprland

    ../../configs/home-manager/ctf.nix
  ];

  programs.home-manager.enable = true;
}

