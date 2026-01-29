# Keymaps configuration
{ ... }:
{
  programs.nixvim.keymaps = [
    # Better escape
    {
      mode = "i";
      key = "jk";
      action = "<Esc>";
      options = {
        desc = "Better escape";
      };
    }
    {
      mode = "i";
      key = "kj";
      action = "<Esc>";
      options = {
        desc = "Better escape";
      };
    }

    # Navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Navigate left";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Navigate down";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Navigate up";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Navigate right";
      };
    }

    # Window management
    {
      mode = "n";
      key = "<leader>w";
      action = "<C-w>";
      options = {
        desc = "Window commands";
      };
    }

    # Clear search
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohlsearch<CR>";
      options = {
        desc = "Clear search highlight";
      };
    }

    # Save
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd>w<CR>";
      options = {
        desc = "Save file";
      };
    }
    {
      mode = "i";
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        desc = "Save file";
      };
    }

    # Quit
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = {
        desc = "Quit";
      };
    }
  ];
}