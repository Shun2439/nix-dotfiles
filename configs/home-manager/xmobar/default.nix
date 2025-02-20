{ pkgs, ... }:
{
  programs.xmobar = {
    enable = true;
    extraConfig = ''
      Config {font="monospace"}
    '';
  };
}

