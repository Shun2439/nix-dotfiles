{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx GPG_TTY (tty)

      if not pgrep -f "emacs --daemon" > /dev/null
      emacs --daemon &
      end
    '';
    shellAliases = {
      ls = "eza --icons";
      la = "ls -al";
      cat = "bat -p";

      e = "emacsclient";
    };
  };
}
