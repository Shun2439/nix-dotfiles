{ pkgs, ...}:
{
  home.packages = with pkgs; [
    bat
    # z
    fd

    jq
    
    texlive.combined.scheme-basic
    devenv

    alsa-utils

    wl-clipboard
  ];

  services.cliphist.enable = true;
}
