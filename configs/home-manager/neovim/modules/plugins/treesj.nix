{ ... }:
{
  programs.nixvim.plugins.treesj = {
    enable = true;
    settings = {
      use_default_keymaps = false;
      max_join_length = 1024;
    };
  };

  programs.nixvim.extraConfigLua = ''
    vim.keymap.set("n", "gS", require("treesj").split, { desc = "Treesj split" })
    vim.keymap.set("n", "gJ", require("treesj").join, { desc = "Treesj join" })
  '';
}
