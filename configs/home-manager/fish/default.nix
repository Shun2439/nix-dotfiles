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

    plugins = with pkgs.fishPlugins; [
      { name = "grc"; src = grc.src; }
      { name = "forgit"; src = forgit.src; }
      # TODO { name = "autols"; src = autols.src; }
      # TODO { name = "cdf"; src = cdf.src; }
    ];
    shellAliases = {
      ls = "eza --icons";
      la = "ls -al";
      cat = "bat -p";

      e = "emacsclient";
    };
  };
}
