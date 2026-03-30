{ ... }:
let
mods = {

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
    ime = ./modules/ime.nix;

    # Advanced features
    autocmd = ./modules/autocmd.nix;

  };
  in
{
  # Predefined module collections
  neovimModules = rec {
    # Presets
    minimal = with mods; [
      core
      theme
      keymaps
    ];
    standard = minimal ++ (with mods; [
      navigation
      fileExplorer
      statusline
      treesitter
      utilities
      ime
    ]);
    full = standard ++ (with mods; [
      lsp
      telescope
      git
      autocmd
    ]);
  };
}
