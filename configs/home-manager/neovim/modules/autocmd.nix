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
