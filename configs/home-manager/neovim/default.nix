{ pkgs, lib, ... }:
let
  neovim_lib = import ./lib.nix { inherit pkgs lib; };
in
{
  imports = neovim_lib.neovimModules.full;

  programs.nixvim = {
    enable = true;
    # EDITOR/VISUAL are managed in modules/home-manager/default.nix
    # (Emacs first, nvim as ALTERNATE_EDITOR).
    defaultEditor = false;
    version.enableNixpkgsReleaseCheck = false;

    luaLoader.enable = true;

    # nixvim pins its own nixpkgs; make it explicit to silence the `follows`
    # trace warning emitted by the module.
    nixpkgs.source = pkgs.path;

    # `magick` lets snacks.image convert anything beyond plain PNG.
    extraPackages = [ pkgs.imagemagick ];
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
