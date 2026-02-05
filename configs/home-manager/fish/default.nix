{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      # Fisher bootstrap - runs once on first shell startup
      if not functions -q fisher
        set --export fisher_path $HOME/.config/fish
        curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
      end

      set -gx GPG_TTY (tty)

      # Emacs daemon is managed by nix-doom-emacs-unstraightened
      # Do not start daemon manually here

      # rbenv
      set -Ux RBENV_ROOT $HOME/.rbenv
      set -U fish_user_paths $RBENV_ROOT/bin $fish_user_paths
      status --is-interactive; and source (rbenv init -|psub)

      direnv hook fish | source
    '';

    plugins = with pkgs.fishPlugins; [
      { name = "spark"; src = spark.src; }
      { name = "puffer"; src = puffer.src; }
      # { name = "async-prompt"; src = async-prompt.src; } # Not work correctly, no idea
      { name = "sponge"; src = sponge.src; }
      { name = "grc"; src = grc.src; }
      { name = "forgit"; src = forgit.src; }
    ];

    shellAliases = {
      # ls = "lsd";
      # la = "ls -al";
      cat = "bat -p";

      e = "emacsclient";
    };
  };

  home.file = {
    ".config/fish/fish_plugins".text = ''
      kpbaks/autols.fish
      yuys13/fish-gcd
      yuys13/fish-ghq-fzf
    '';
  };
}
