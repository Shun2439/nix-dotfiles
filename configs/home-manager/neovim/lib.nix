{ ... }:
let
mods = {

    # Core functionality
    core = ./modules/core.nix;
    theme = ./modules/theme.nix;
    keymaps = ./modules/keymaps.nix;

    # Plugins
    flash = ./modules/plugins/flash.nix;
    oil = ./modules/plugins/oil.nix;
    snacks = ./modules/plugins/snacks.nix;
    lazygit = ./modules/plugins/lazygit.nix;
    which-key = ./modules/plugins/which-key.nix;
    toggleterm = ./modules/plugins/toggleterm.nix;
    statusline = ./modules/statusline.nix;
    lsp = ./modules/lsp.nix;
    telescope = ./modules/plugins/telescope.nix;
    gitsigns = ./modules/plugins/gitsigns.nix;
    treesitter = ./modules/plugins/treesitter.nix;
    nvim-ufo = ./modules/plugins/nvim-ufo.nix;
    utilities = ./modules/utilities.nix;
    treesj = ./modules/plugins/treesj.nix;
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
      which-key
    ];
    standard = minimal ++ (with mods; [
      flash
      oil
      statusline
      treesitter
      toggleterm
      treesj
      utilities
      nvim-ufo
      ime
      snacks
      lazygit
    ]);
    full = standard ++ (with mods; [
      lsp
      telescope
      gitsigns
      autocmd
    ]);
  };
}
