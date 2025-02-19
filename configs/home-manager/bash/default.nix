{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ls = "eza";
      la = "ls -al";
    };
  };
}
