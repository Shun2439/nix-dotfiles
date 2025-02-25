{ pkgs, ... }:
{
  home.file = {
    ".xinitrc" = {
      target = ".xinitrc";
      source = ./.xinitrc;
    };
    ".xprofile" = {
      target = ".xprofile";
      source = ./.xprofile;
    };
  };
}
