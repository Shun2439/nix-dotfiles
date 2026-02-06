{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ""
      export GPG_TTY=$(tty)
    "";

    shellAliases = {
      ls = "eza";
      la = "ls -al";
    };
  };
}
