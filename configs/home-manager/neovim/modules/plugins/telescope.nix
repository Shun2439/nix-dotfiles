# Fuzzy finder and search functionality
{ pkgs, ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
  };

  # Telescope extensions
  programs.nixvim.plugins.telescope.extensions = {
    fzf-native.enable = true;
    file-browser.enable = true;
    ui-select.enable = true;
  };

  programs.nixvim.extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];
}
