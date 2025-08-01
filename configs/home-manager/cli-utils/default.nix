{ pkgs, ...}:
{
  home.packages = with pkgs; [
    bat
    # z
    fd

    jq
    
    texlive.combined.scheme-basic
    devenv

    # moc

    zoxide
  ];
}
