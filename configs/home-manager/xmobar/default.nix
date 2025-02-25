{ pkgs, ... }:
{
  programs.xmobar = {
    enable = true;
    extraConfig = builtins.readFile ./.xmobarrc;
  };

  # home.file = {
  #   ".xmobarrc" = {
  #     target = ".xmobarrc";
  #     source = ./.xmobarrc;
  #   };
  # };
}

