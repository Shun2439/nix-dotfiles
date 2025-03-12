{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx GPG_TTY (tty)
    '';
    shellAliases = {
      ls = "eza --icons";
      la = "ls -al";
    };
  };
}
