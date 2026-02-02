{ inputs, ... }:
{
  imports = [
    ./modules/core.nix
    ./modules/theme.nix
    ./modules/statusline.nix
    ./modules/keymaps.nix
    # ./modules/telescope.nix
    ./modules/git.nix
    ./modules/utilities.nix
  ];

  programs.nixvim = {
    enable = true;
    version.enableNixpkgsReleaseCheck = false;
  };
}
