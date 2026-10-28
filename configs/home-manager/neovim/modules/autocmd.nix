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
                higroup = "Visual",
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
      -- Drop the "[Process exited N]" virtual text that Neovim >= 0.12 overlays
      -- on the cursor line when a terminal job finishes.
      --
      -- It used to be buffer text, so snacks.nvim's `hide_process_exited()`
      -- (which scans buffer lines for `^%[Process exited 0%]`) removed it. Since
      -- Neovim 0.12 it is an extmark in the `nvim.terminal.exitmsg` namespace,
      -- so this is the only reliable way to get rid of it. It otherwise covers
      -- the snacks dashboard logo.
      vim.api.nvim_create_autocmd("TermClose", {
        callback = function(ev)
          vim.schedule(function()
            if vim.api.nvim_buf_is_valid(ev.buf) then
              vim.api.nvim_buf_clear_namespace(
                ev.buf,
                vim.api.nvim_create_namespace("nvim.terminal.exitmsg"),
                0,
                -1
              )
            end
          end)
        end,
      })

      -- Folding is managed by nvim-ufo (see modules/plugins/nvim-ufo.nix).
      -- Do not set `foldmethod` here or ufo loses control of the folds.

      -- Better netrw settings
      vim.g.netrw_browse_split = 0
      vim.g.netrw_banner = 0
      vim.g.netrw_winsize = 30
    '';
  };
}
