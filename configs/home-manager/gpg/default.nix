{ ... }:
{
  programs.gpg = {
    enable = true;
    settings = {
      pinentry-mode = "loopback";
    };
  };

  services.gpg-agent = {
    enable = true;

    # パスフレーズのキャッシュ: 最終使用から1日、上限7日
    defaultCacheTtl = 86400; # 1日
    maxCacheTtl = 604800; # 7日

    # pinentry.package = pkgs.pinentry-emacs;

    enableSshSupport = true;
    enableFishIntegration = true;

    extraConfig = ''
      # allow-emacs-pinentry
      allow-loopback-pinentry
    '';
  };
}
