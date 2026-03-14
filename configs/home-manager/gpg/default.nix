{ pkgs, ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      pinentry-mode = "loopback";
    };
  };

  services.gpg-agent = {
    enable = true;

    # pinentry.package = pkgs.pinentry-emacs;

    enableSshSupport = true;
    enableFishIntegration = true;

    extraConfig = ''
      # allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };
}
