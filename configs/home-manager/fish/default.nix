{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    functions = {
      ghq_fzf = {
        body = ''
          set -l src (ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 (ghq root)/{}/README.*")
          if test -n "$src"
            cd (ghq root)/$src
            commandline -f repaint
          end
        '';
      };
    };
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

      bind \cg ghq_fzf
    '';

    plugins = with pkgs.fishPlugins; [
      {
        name = "spark";
        src = spark.src;
      }
      # {
      #   name = "puffer";
      #   src = puffer.src;
      # }
      # { name = "async-prompt"; src = async-prompt.src; } # Not work correctly, no idea
      {
        name = "sponge";
        src = sponge.src;
      }
      {
        name = "grc";
        src = grc.src;
      }
      {
        name = "forgit";
        src = forgit.src;
      }
    ];

    shellAliases = {
      # ls = "lsd";
      # la = "ls -al";
      cat = "bat -p";

      e = "emacsclient";
      lg = "lazygit";
      nv="nvim";

      proot="cd $(git rev-parse --show-toplevel)";
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
