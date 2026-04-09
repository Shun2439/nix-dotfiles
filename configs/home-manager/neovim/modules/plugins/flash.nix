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
    keymaps = {
      "s" = {
        mode = [
          "n"
          "x"
          "o"
        ];
        action = "flash";
        desc = "Flash";
      };
      "S" = {
        mode = [
          "n"
          "x"
          "o"
        ];
        action = "flash treesitter";
        desc = "Flash Treesitter";
      };
      "r" = {
        mode = "o";
        action = "flash remote";
        desc = "Remote Flash";
      };
      "R" = {
        mode = [
          "o"
          "x"
        ];
        action = "flash treesitter";
        desc = "Flash Treesitter";
      };
      "<c-s>" = {
        mode = {
          "c" = "";
        };
        action = "flash toggle";
        desc = "Toggle Flash Search";
      };
    };
  };
}
