{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = builtins.readFile ./starship.toml;
  };
}

