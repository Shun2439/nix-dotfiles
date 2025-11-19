{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    # z
    fd

    jq

    texlive.combined.scheme-medium
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
