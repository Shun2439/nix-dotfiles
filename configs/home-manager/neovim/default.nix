{ inputs, ... }:
{
  imports = [
    ./modules/core.nix
    ./modules/theme.nix
    ./modules/statusline.nix
    ./modules/keymaps.nix
    ./modules/navigation.nix
    # ./modules/telescope.nix
    ./modules/git.nix
    ./modules/treesitter.nix
    ./modules/utilities.nix
    ./modules/ime.nix
  ];

  programs.nixvim = {
    enable = true;
    version.enableNixpkgsReleaseCheck = false;
  };
}
