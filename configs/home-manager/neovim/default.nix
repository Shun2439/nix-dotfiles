{ pkgs, lib, ... }:
let
  neovim_lib = import ./lib.nix { inherit pkgs lib; };
in
{
  imports = neovim_lib.neovimModules.full;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    version.enableNixpkgsReleaseCheck = false;

    loader.enable = true;
  };
  programs.neovide = {
    enable = true;
    settings = {
      font = {
        normal = [ "Moralerspace Radon HW" ];
        size = 14.0;
      };
      title-hidden = true;
    };
  };
}
