{ inputs, ... }:
{
  imports = [
    ./modules/core.nix
    ./modules/theme.nix
    ./modules/file-explorer.nix
    ./modules/statusline.nix
    ./modules/keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    version.enableNixpkgsReleaseCheck = false;
  };
}