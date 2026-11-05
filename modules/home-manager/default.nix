{
  ...
}:
{
  imports = [
    ../../configs/home-manager/gpg

    ../../configs/home-manager/cli-utils
    ../../configs/home-manager/development.nix

    # ../../configs/home-manager/vim
    ../../configs/home-manager/neovim
    ../../configs/home-manager/emacs

    ../../configs/home-manager/fzf
    ../../configs/home-manager/atuin

    # ../../configs/home-manager/tmux

    ../../configs/home-manager/git
    ../../configs/home-manager/lazygit

    ../../configs/home-manager/fish
    ../../configs/home-manager/starship

    ../../configs/home-manager/eza

    # ../../configs/home-manager/eww

    ../../configs/home-manager/ctf.nix

    ../../configs/home-manager/buzz
  ];

  # Editor delegation: Emacs daemon first, nvim as the fallback when the
  # daemon is down (e.g. right after a broken doom-emacs rebuild).
  # `git commit` is unaffected -- core.editor = "nvim" takes precedence.
  # NOTE: `sudo -e` may still ignore these due to sudo's env_reset.
  home.sessionVariables = {
    EDITOR = "emacsclient -t"; # tty callers (systemctl edit, crontab -e, ...)
    VISUAL = "emacsclient -c"; # GUI callers get a frame
    ALTERNATE_EDITOR = "nvim";
  };

  programs.home-manager = {
    enable = true;
  };
}
