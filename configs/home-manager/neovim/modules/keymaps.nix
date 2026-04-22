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
    {
      mode = "n";
      key = "<leader>uz";
      action = "<cmd>lua Snacks.picker.zoxide()<CR>";
      options.desc = "zoxide";
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
    # Other
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
      key = "<leader>Z";
      action = "<cmd>lua Snacks.zen.zoom()<CR>";
      options = {
        desc = "Toggle Zoom";
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
      key = "<leader>S";
      action = "<cmd>lua Snacks.scratch.select()<CR>";
      options = {
        desc = "Select Scratch Buffer";
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
      key = "<leader>cR";
      action = "<cmd>lua rename.rename_file()<CR>";
      options = {
        desc = "Rename file";
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>gB";
      action = "<cmd>lua Snacks.gitbrowse()<CR>";
      options = {
        desc = "Git Browse";
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
      key = "<leader>un";
      action = "<cmd>lua Snacks.notifier.hide()<CR>";
      options = {
        desc = "Dismiss All Notifications";
      };
    }
    {
      mode = "n";
      key = "<c-/>";
      action = "<cmd>lua Snacks.terminal()<CR>";
      options = {
        desc = "Toggle Terminal";
      };
    }
    {
      mode = "n";
      key = "<c-_>"; # ?
      action = "<cmd>lua Snacks.terminal()<CR>";
      options = {
        desc = "which_key_ignore";
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
    # Create some toggle mappings
    # 通知が出る
    {
      mode = "n";
      key = "<leader>us";
      action = ''<cmd>lua Snacks.toggle.option("spell", { name = "Spelling" }):toggle()<cr>'';
      options.desc = "Toggle Spelling";
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = ''<cmd>lua Snacks.toggle.option("wrap", { name = "Wrap" }):toggle()<cr>'';
      options.desc = "Toggle Wrap";
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = ''<cmd>lua Snacks.toggle.option("relativenumber", { name = "Relative Number" }):toggle()<cr>'';
      options.desc = "Toggle Relative Number";
    }
    {
      mode = "n";
      key = "<leader>ud";
      action = "<cmd>lua Snacks.toggle.diagnostics():toggle()<cr>";
      options.desc = "Toggle Diagnostics";
    }
    {
      mode = "n";
      key = "<leader>ul";
      action = "<cmd>lua Snacks.toggle.line_number():toggle()<cr>";
      options.desc = "Toggle Line Number";
    }
    {
      mode = "n";
      key = "<leader>uc";
      action = ''<cmd>lua Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):toggle()<CR>'';
      options.desc = "Toggle Conceallevel";
    }
    {
      mode = "n";
      key = "<leader>uT";
      action = "<cmd>lua Snacks.toggle.treesitter():toggle()<cr>";
      options.desc = "Toggle Treesitter";
    }
    {
      mode = "n";
      key = "<leader>ub";
      action = ''<cmd>lua Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):toggle()<cr>'';
      options.desc = "Toggle Dark Background";
    }
    {
      mode = "n";
      key = "<leader>uh";
      action = "<cmd>lua Snacks.toggle.inlay_hints():toggle()<cr>";
      options.desc = "Toggle Inlay Hints";
    }
    {
      mode = "n";
      key = "<leader>ug";
      action = "<cmd>lua Snacks.toggle.indent():toggle()<cr>";
      options.desc = "Toggle Indent";
    }
    {
      mode = "n";
      key = "<leader>uD";
      action = "<cmd>lua Snacks.toggle.dim():toggle()<cr>";
      options.desc = "Toggle Dim";
    }
    # ToggleTerm
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
