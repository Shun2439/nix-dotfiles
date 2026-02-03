{ pkgs, lib, ... }:
{
  # Create a function to easily import neovim modules
  makeNeovimConfig = modules: {
    imports = modules;
    programs.nixvim = {
      enable = true;
      version.enableNixpkgsReleaseCheck = false;
    };
  };

  # Predefined module collections
  neovimModules = {
    # Core functionality
    core = ./modules/core.nix;
    theme = ./modules/theme.nix;
    keymaps = ./modules/keymaps.nix;

    # Plugins
    navigation = ./modules/navigation.nix;
    fileExplorer = ./modules/file-explorer.nix;
    statusline = ./modules/statusline.nix;
    lsp = ./modules/lsp.nix;
    telescope = ./modules/telescope.nix;
    git = ./modules/git.nix;
    treesitter = ./modules/treesitter.nix;
    utilities = ./modules/utilities.nix;

    # Advanced features
    autocmd = ./modules/autocmd.nix;

    # Presets
    minimal = [ ./modules/core.nix ./modules/theme.nix ./modules/keymaps.nix ];
    standard = [
      ./modules/core.nix
      ./modules/theme.nix
      ./modules/keymaps.nix
      ./modules/navigation.nix
      ./modules/file-explorer.nix
      ./modules/statusline.nix
      ./modules/treesitter.nix
      ./modules/utilities.nix
    ];
    full = [
      ./modules/core.nix
      ./modules/theme.nix
      ./modules/keymaps.nix
      ./modules/navigation.nix
      ./modules/file-explorer.nix
      ./modules/statusline.nix
      ./modules/lsp.nix
      ./modules/telescope.nix
      ./modules/git.nix
      ./modules/treesitter.nix
      ./modules/utilities.nix
      ./modules/autocmd.nix
    ];
  };
}