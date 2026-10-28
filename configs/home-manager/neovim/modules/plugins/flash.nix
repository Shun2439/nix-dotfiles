# Navigation plugins (flash.nvim)
{ ... }:
{
  programs.nixvim.plugins.flash = {
    enable = true;
    settings = {
      modes = {
        char = {
          enabled = true;
          autohide = true;
        };
        search = {
          enabled = true;
        };
      };
      label = {
        rainbow = {
          enabled = true;
          shade = 5;
        };
      };
      jump = {
        autojump = false;
      };
    };
  };

  programs.nixvim.extraConfigLua = ''
    vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
    vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
    vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
    vim.keymap.set({ "c" }, "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
  '';
}
