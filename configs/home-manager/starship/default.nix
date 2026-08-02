{ lib, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    settings = lib.importTOML ./starship.toml;
  };
}
