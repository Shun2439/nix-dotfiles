{ pkgs, lib, ... }:
let
  neovim_lib = import ./lib.nix { inherit pkgs lib; };
in
{
  imports = neovim_lib.neovimModules.full;

  programs.nixvim = {
    enable = true;
    version.enableNixpkgsReleaseCheck = false;
  };
}
