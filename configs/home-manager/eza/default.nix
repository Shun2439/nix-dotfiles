{ pkgs, ... }:
{
  programs.eza = {
    enable = false;

    icons = "auto";
    enableBashIntegration = true;
    enableFishIntegration = true;
    git = true;
  };
}
