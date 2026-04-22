# Keybindings - simplified version for snacks.nvim
{ ... }:
{
  programs.nixvim.keymaps = [
    # snacks
    # Top Pickers & Explorer
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
      key = "<leader>:";
      action = "<cmd> lua Snacks.picker.command_history()<CR>";
      options = {
        desc = "Command History";
      };
    }
    # {
    #   mode = "n";
    #   key = "<leader>n";
    #   action = "<cmd>lua Snacks.notifier.show_history()<CR>";
    #   options = {
    #     desc = "Notification History";
    #   };
    # }
    {
      mode = "n";
      key = "<leader>n";
      action = "<cmd>lua Snacks.picker.notifications()<CR>";
      options = {
        desc = "Notification History";
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

    # TODO find
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options = {
        desc = "Buffers";
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
      key = "<leader>fp";
      action = "<cmd>lua Snacks.picker.projects()<CR>";
      options = {
        desc = "Projects";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options = {
        desc = "Recent";
      };
    }

    # git
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
    {
      mode = "n";
      key = "<leader>gL";
      action = "<cmd>lua Snacks.picker.git_log_line()<CR>";
      options = {
        desc = "Git Log Line";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options = {
        desc = "Git Status";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>lua Snacks.picker.git_stash()<CR>";
      options = {
        desc = "Git Stash";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>lua Snacks.picker.git_diff()<CR>";
      options = {
        desc = "Git Diff (Hunks)";
      };
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>lua Snacks.picker.git_log_file()<CR>";
      options = {
        desc = "Git Log File";
      };
    }

    # TODO gh
    {
      mode = "n";
      key = "<leader>gi";
      action = "<cmd>lua Snacks.picker.gh_issue()<CR>";
      options = {
        desc = "GitHub Issues (open)";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>lua Snacks.picker.gh_pr()<CR>";
      options = {
        desc = "GitHub Pull Requests (open)";
      };
    }
    # Grep
    { 
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options = {
        desc = "Buffer Lines";
      };
    }
    {
      mode = "n";
      key = "<leader>sB";
      action = "<cmd>lua Snacks.picker.grep_buffers()<CR>";
      options = {
        desc = "Grep Open Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options = {
        desc = "Grep";
      };
    }
    {
      mode = ["n" "x"];
      key = "<leader>sw";
      action = "<cmd>lua Snacks.picker.grep_word()<CR>";

      options = {
        desc = "Visual selection or word";
      };
    }
    # search
    {
      mode = "n";
      key = "<leader>s\"";
      action = "<cmd>lua Snacks.picker.registers()<CR>";
      options.desc = "Registers";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action = "<cmd>lua Snacks.picker.search_history()<CR>";
      options.desc = "Search History";
    }
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>lua Snacks.picker.autocmds()<CR>";
      options.desc = "Autocmds";
    }
    {
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options.desc = "Buffer Lines";
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options.desc = "Command History";
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>lua Snacks.picker.commands()<CR>";
      options.desc = "Commands";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      options.desc = "Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sD";
      action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
      options.desc = "Buffer Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>lua Snacks.picker.help()<CR>";
      options.desc = "Help Pages";
    }
    {
      mode = "n";
      key = "<leader>sH";
      action = "<cmd>lua Snacks.picker.highlights()<CR>";
      options.desc = "Highlights";
    }
    {
      mode = "n";
      key = "<leader>si";
      action = "<cmd>lua Snacks.picker.icons()<CR>";
      options.desc = "Icons";
    }
    {
      mode = "n";
      key = "<leader>sj";
      action = "<cmd>lua Snacks.picker.jumps()<CR>";
      options.desc = "Jumps";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options.desc = "Keymaps";
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>lua Snacks.picker.loclist()<CR>";
      options.desc = "Location List";
    }
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>lua Snacks.picker.marks()<CR>";
      options.desc = "Marks";
    }
    {
      mode = "n";
      key = "<leader>sM";
      action = "<cmd>lua Snacks.picker.man()<CR>";
      options.desc = "Man Pages";
    }
    {
      mode = "n";
      key = "<leader>sp";
      action = "<cmd>lua Snacks.picker.lazy()<CR>";
      options.desc = "Search for Plugin Spec";
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>lua Snacks.picker.resume()<CR>";
      options.desc = "Resume";
    }
    {
      mode = "n";
      key = "<leader>su";
      action = "<cmd>lua Snacks.picker.undo()<CR>";
      options.desc = "Undo History";
    }
    {
      mode = "n";
      key = "<leader>uC";
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
      options.desc = "Colorschemes";
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
      key = "gD";
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
      options.desc = "Goto Declaration";
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
    {
      mode = "n";
      key = "gI";
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
      options.desc = "Goto Implementation";
    }
    {
      mode = "n";
      key = "gy";
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
      options.desc = "Goto T[y]pe Definition";
    }
    {
      mode = "n";
      key = "gai";
      action = "<cmd>lua Snacks.picker.lsp_incoming_calls()<CR>";
      options.desc = "C[a]lls Incoming";
    }
    {
      mode = "n";
      key = "gao";
      action = "<cmd>lua Snacks.picker.lsp_outgoing_calls()<CR>";
      options.desc = "C[a]lls Outgoing";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      options.desc = "LSP Symbols";
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      options.desc = "LSP Workspace Symbols";
    }
    # TODO Other
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
      key = "<leader>bd";
      action = "<cmd>lua Snacks.bufdelete()<CR>";
      options = {
        desc = "Delete Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>ToggleTerm direction=float<cr>";
      options = {
        desc = "Toggle floating terminal";
      };
    }
    {
      mode = "n";
      key = "<leader>th";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options.desc = "Toggle horizontal terminal";
    }
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options.desc = "Toggle vertical terminal";
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm direction=tab<cr>";
      options.desc = "Toggle tab terminal";
    }
    {
      mode = "t";
      key = "<Esc>";
      action = "<C-\\><C-n>";
      options = {
        desc = "Escape from terminal with <Esc>";
      };
    }
    {
      mode = "n";
      key = "]]";
      action = "<cmd>lua Snacks.words.jump(vim.v.count1)<CR>";
      options = {
        desc = "Next Reference";
      };
    }
    {
      mode = "n";
      key = "[[";
      action = "<cmd>lua Snacks.words.jump(-vim.v.count1)<CR>";
      options = {
        desc = "Prev Reference";
      };
    }
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Oil<cr>";
      options = {
        silent = true;
        desc = "Oil";
      };
    }
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
      mode = "n";
      key = "<leader>q";
      action = "<cmd>q<CR>";
      options = {
        desc = "Quit";
      };
    }
    {
      mode = "n";
      key = "<leader>mp";
      action = "<cmd>RenderMarkdown toggle<cr>";
      options = {
        desc = "Markdown Preview Toggle";
      };
    }
    {
      mode = "i";
      key = "<C-j>";
      action = "<Plug>(skkeleton-toggle)";
      options = {
        desc = "Toggle SKK";
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
  ];
}
