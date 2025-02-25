{ pkgs, ... }:
{
  programs.xmobar = {
    enable = true;
    # extraConfig = ''
    #   Config {font="monospace"}
    # '';
  };

  home.file = {
    ".xmobarrc" = {
      target = ".xmobarrc";
      source = ./.xmobarrc;
    };
  };
}

