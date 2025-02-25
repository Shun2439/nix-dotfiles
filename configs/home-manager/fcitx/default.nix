# { pkgs-stable, ... }:
{ pkgs, ... }:
{
  home.file = {
    ".xinitrc" = {
      target = ".xinitrc";
      source = ./.xinitrc;
    };
  };
}

