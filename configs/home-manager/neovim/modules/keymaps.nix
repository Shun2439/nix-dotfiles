# Keybindings - simplified version for snacks.nvim
{ ... }:
{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>nohlsearch<CR>";
      options = {
        desc = "Clear search highlight";
      };
    }
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
    {
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = {
        desc = "Quit";
      };
    }

    {
      mode = "n";
      key = "<leader><space>";
      action = "<cmd>lua Snacks.picker.smart()<CR>";
      options = {
        desc = "Smart Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>lua Snacks.explorer()<CR>";
      options = {
        desc = "File Explorer";
      };
    }

    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options = {
        desc = "Find Files";
      };
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>lua Snacks.picker.git_files()<CR>";
      options = {
        desc = "Find Git Files";
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua Snacks.lazygit()<CR>";
      options = {
        desc = "Lazygit";
      };
    }

    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options = {
        desc = "Git Branches";
      };
    }
    {
      mode = "n";
      key = "<leader>gl";
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options = {
        desc = "Git Log";
      };
    }

    # LSP
    {
      mode = "n";
      key = "gd";
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
      options = {
        desc = "Goto Definition";
      };
    }
    {
      mode = "n";
      key = "gr";
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
      options = {
        desc = "References";
        nowait = true;
      };
    }

    # Other & Utilities
    {
      mode = "n";
      key = "<leader>z";
      action = "<cmd>lua Snacks.zen()<CR>";
      options = {
        desc = "Toggle Zen Mode";
      };
    }
    {
      mode = "n";
      key = "<leader>.";
      action = "<cmd>lua Snacks.scratch()<CR>";
      options = {
        desc = "Toggle Scratch Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.notifier.show_history()<CR>";
      options = {
        desc = "Notification History";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {
        desc = "Delete Buffer";
      };
    }
    {
      mode = "n";
      key = "<C-/>";      
      action = "<cmd>lua Snacks.terminal()<CR>";
      options = {
        desc = "Toggle Terminal";
      };
    }
    {
      mode = "n";
      key = "]";
      action = "<cmd>lua Snacks.words.jump(vim.v.count1)<CR>";
      options = {
        desc = "Next Reference";
      };
    }
    {
      mode = "n";
      key = "[";
      action = "<cmd>lua Snacks.words.jump(-vim.v.count1)<CR>";
      options = {
        desc = "Prev Reference";
      };
    }
  ];
}
