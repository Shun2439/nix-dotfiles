{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
    '';
  };
}

