{ ... }:
{
  programs.nixvim.plugins.treesj = {
    enable = true;
    settings = {
      use_default_keymaps = false;
      max_join_length = 1024;
    };
    keymaps = {
      split = "gS";
      join = "gJ";
    };
  };
}
