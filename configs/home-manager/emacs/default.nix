{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    extraConfig = ''
      ;; Enable native compilation
      (if (fboundp 'native-compile-async)
          (setq native-comp-deferred-compilation t))

      ;; Load theme
      ;; (load-theme 'doom-one t)
      
      ;; Basic settings
      (setq inhibit-startup-message t
            scroll-conservatively 101
            scroll-margin 2
            scroll-step 1)
    '';
  };

  # home.packages = with pkgs; [
  #   git
  #   (ripgrep.override { withPCRE2 = true; })
  #   gnutls
  #   (emacs.pkgs.withPackages (epkgs: with epkgs; [
  #     evil
  #     which-key
  #     projectile
  #     magit
  #     company
  #     flycheck
  #     doom-themes
  #     doom-modeline
  #     vterm
  #     pdf-tools
  #   ]))
  # ];
}

