{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    # extraConfig = builtins.readFile ./init.el;
    extraConfig = ''
      (setq default-input-method "japanese-skk")
    '';
  };
}

