{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -gx GPG_TTY (tty)

      if not pgrep -f "emacs --daemon" > /dev/null
      emacs --daemon &
      end

      # rbenv
      set -Ux RBENV_ROOT $HOME/.rbenv
      set -U fish_user_paths $RBENV_ROOT/bin $fish_user_paths
      status --is-interactive; and source (rbenv init -|psub)

      # grc
      source /usr/local/etc/grc.fish
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
