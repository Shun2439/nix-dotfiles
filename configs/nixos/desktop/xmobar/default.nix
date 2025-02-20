{ pkgs, ... }:
{
  home.file = {
    ".xmobarrc" = {
      target = ".xmobarrc";
      source = ./.xmobarrc;
    };
  };
}

