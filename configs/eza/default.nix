{ pkgs, ... }:
{
  programs.eza = {
    enable = true;

    icons = "auto";
    enableBashIntegration = true;
    # enableFishIntegration = true;
    git = true;
  };
}
