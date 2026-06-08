{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "Moralerspace Radon HW";
      theme = "Catppuccin Mocha";
    };
  };
}
