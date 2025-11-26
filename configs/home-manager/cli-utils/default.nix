{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    # z
    fd
    ripgrep

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
