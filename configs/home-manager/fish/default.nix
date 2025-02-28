{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      
    '';
    shellAliases = {
      ls = "eza --icons";
      la = "ls -al";
    };
  };
}
