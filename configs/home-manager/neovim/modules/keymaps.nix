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

    # Enhanced lazygit integration
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
      options = {
        desc = "Open lazygit in current directory";
      };
    }
    {
      mode = "n";
      key = "<leader>gG";
      action = "<cmd>LazyGitCurrentFile<CR>";
      options = {
        desc = "Open lazygit in current file's project root";
      };
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>LazyGitConfig<CR>";
      options = {
        desc = "Open lazygit configuration";
      };
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>LazyGitFilter<CR>";
      options = {
        desc = "Open lazygit filter (project commits)";
      };
    }
    {
      mode = "n";
      key = "<leader>gF";
      action = "<cmd>LazyGitFilterCurrentFile<CR>";
      options = {
        desc = "Open lazygit filter (current file commits)";
      };
    }
  ];
}