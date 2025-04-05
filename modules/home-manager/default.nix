{ config, pkgs, ... }:
{
  imports = [
    ../../configs/nixos/core/nixos.nix

    ../../configs/home-manager/development.nix

    ../../configs/home-manager/wezterm
    ../../configs/home-manager/vim
    ../../configs/home-manager/fzf

    ../../configs/home-manager/git
    ../../configs/home-manager/lazygit

    ../../configs/home-manager/fish ../../configs/home-manager/tmux
    ../../configs/home-manager/starship
    ../../configs/home-manager/eza

    ../../configs/home-manager/browser

    ../../configs/home-manager/xmobar
    ../../configs/home-manager/x
    ../../configs/home-manager/hyperland

    ../../configs/home-manager/ctf.nix
  ];

  home = rec {
    username = "shun2439";
    homeDirectory = "/home/${username}";
    stateVersion = "22.11";

    packages = with pkgs; [
      vscode
      # eclipse

      fd
      bat
      # z

      dmenu
      gmrun

      alsa-utils
      oneko

      pcmanfm
      ranger

      vlc
      mpv

      shotcut
      gimp
      inkscape
      audacity

      # blender

      flameshot

      rpi-imager

      # texlive # not worked
      texlive.combined.scheme-basic
    ];
  };
  programs.home-manager.enable = true;
}

