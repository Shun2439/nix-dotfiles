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
}
