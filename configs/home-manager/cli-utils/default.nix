{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    # z
    fd

    jq

    texlive.combined.scheme-basic
    devenv

    # moc
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration= true;
    # replace cd
    options = [
      "--cmd cd"
    ];
  };
}
