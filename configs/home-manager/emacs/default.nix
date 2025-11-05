{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    # extraConfig = builtins.readFile ./init.el;
  };
}

