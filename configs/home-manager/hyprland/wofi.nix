{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wofi
    wofi-emoji
  ];
}

