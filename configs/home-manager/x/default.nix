{ pkgs, ... }:
{
  home.file = {
    ".xprofile" = {
      target = ".xprofile";
      source = ./.xprofile;
    };
  };
}
