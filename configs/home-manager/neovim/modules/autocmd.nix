# Auto commands and custom Lua functions
{ ... }:
{
  programs.nixvim = {
    autoCmd = [
      # Highlight on yank
      {
        event = "TextYankPost";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({
                higroup = 'Visual',
                timeout = 40,
              })
            end
          '';
        };
      }

      # Set indentation for specific file types
      {
        event = "FileType";
        pattern = [ "nix" ];
        callback = {
          __raw = "function() vim.opt_local.tabstop = 2 vim.opt_local.shiftwidth = 2 end";
        };
      }
      {
        event = "FileType";
        pattern = [ "python" ];
        callback = {
          __raw = "function() vim.opt_local.tabstop = 4 vim.opt_local.shiftwidth = 4 end";
        };
      }
      {
        event = "FileType";
        pattern = [
          "javascript"
          "typescript"
        ];
        callback = {
          __raw = "function() vim.opt_local.tabstop = 2 vim.opt_local.shiftwidth = 2 end";
        };
      }

      # Format on save for specific file types
      {
        event = "BufWritePre";
        pattern = [ "*.nix" ];
        callback = {
          __raw = "function() vim.lsp.buf.format() end";
        };
      }

      # Remove trailing whitespace on save
      {
        event = "BufWritePre";
        pattern = "*";
        callback = {
          __raw = "function() vim.cmd([[%s/\s\+$//e]]) end";
        };
      }
    ];

    # Custom Lua configuration
    extraConfigLua = ''
      -- Set up custom functions

      -- Function to toggle numbers
      local function toggle_numbers()
        if vim.opt.number:get() then
          vim.opt.number = false
          vim.opt.relativenumber = false
        else
          vim.opt.number = true
          vim.opt.relativenumber = true
        end
      end

      -- Function to toggle wrap
      local function toggle_wrap()
        vim.opt.wrap = not vim.opt.wrap:get()
      end

      -- Make functions available globally
      _G.toggle_numbers = toggle_numbers
      _G.toggle_wrap = toggle_wrap

      -- Set up additional keymaps
      vim.keymap.set('n', '<leader>n', toggle_numbers, { desc = 'Toggle line numbers' })
      vim.keymap.set('n', '<leader>w', toggle_wrap, { desc = 'Toggle line wrap' })

      -- Set up folds
      vim.opt.foldmethod = 'indent'
      vim.opt.foldlevel = 99
      vim.opt.foldenable = true

      -- Better netrw settings
      vim.g.netrw_browse_split = 0
      vim.g.netrw_banner = 0
      vim.g.netrw_winsize = 30
    '';
  };
}
