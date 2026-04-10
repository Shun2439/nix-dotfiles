{ ... }:
let
mods = {

    # Core functionality
    options = ./modules/options.nix;
    theme = ./modules/theme.nix;
    keymaps = ./modules/keymaps.nix;

    # Plugins
    flash = ./modules/plugins/flash.nix;
    oil = ./modules/plugins/oil.nix;
    snacks = ./modules/plugins/snacks.nix;
    lazygit = ./modules/plugins/lazygit.nix;
    which-key = ./modules/plugins/which-key.nix;
    toggleterm = ./modules/plugins/toggleterm.nix;
    lualine = ./modules/plugins/lualine.nix;
    lsp = ./modules/lsp.nix;
    telescope = ./modules/plugins/telescope.nix;
    gitsigns = ./modules/plugins/gitsigns.nix;
    treesitter = ./modules/plugins/treesitter.nix;
    nvim-ufo = ./modules/plugins/nvim-ufo.nix;
    navic = ./modules/plugins/navic.nix;
    barbecue = ./modules/plugins/barbecue.nix;
    utilities = ./modules/utilities.nix;
    treesj = ./modules/plugins/treesj.nix;
    skkeleton = ./modules/plugins/skkeleton.nix;

    # Advanced features
    autocmd = ./modules/autocmd.nix;
  };
  in
{
  # Predefined module collections
  neovimModules = rec {
    # Presets
    minimal = with mods; [
      options
      theme
      keymaps
      which-key
    ];
    standard = minimal ++ (with mods; [
      flash
      oil
      lualine
      navic
      barbecue
      treesitter
      toggleterm
      treesj
      utilities
      nvim-ufo
      skkeleton
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
