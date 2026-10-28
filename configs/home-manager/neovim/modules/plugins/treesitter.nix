# Syntax highlighting and code parsing
{ config, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    highlight = {
      enable = true;
      enableVimSyntax = false;
    };
    indent.enable = true;
    grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
      bash
      c
      cpp
      css
      html
      javascript
      json
      lua
      markdown
      markdown_inline
      nix
      python
      query
      regex
      rust
      toml
      tsx
      typescript
      vim
      vimdoc
      yaml
    ];
  };

  programs.nixvim.plugins.treesitter-textobjects.enable = true;

  # nvim-treesitter-textobjects no longer configures keymaps through
  # `require("nvim-treesitter.configs").setup()`. They have to be set with
  # Neovim's keymap API against the public modules instead.
  programs.nixvim.extraConfigLua = ''
    local select_textobject = function(query)
      return function()
        require("nvim-treesitter-textobjects.select").select_textobject(query, "textobjects")
      end
    end

    local goto_textobject = function(method, query)
      return function()
        require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
      end
    end

    -- Select
    vim.keymap.set({ "x", "o" }, "af", select_textobject("@function.outer"), { desc = "Select function (outer)" })
    vim.keymap.set({ "x", "o" }, "if", select_textobject("@function.inner"), { desc = "Select function (inner)" })
    vim.keymap.set({ "x", "o" }, "ac", select_textobject("@class.outer"), { desc = "Select class (outer)" })
    vim.keymap.set({ "x", "o" }, "ic", select_textobject("@class.inner"), { desc = "Select class (inner)" })
    vim.keymap.set({ "x", "o" }, "aa", select_textobject("@parameter.outer"), { desc = "Select parameter (outer)" })
    vim.keymap.set({ "x", "o" }, "ia", select_textobject("@parameter.inner"), { desc = "Select parameter (inner)" })

    -- Move
    vim.keymap.set({ "n", "x", "o" }, "]m", goto_textobject("goto_next_start", "@function.outer"), { desc = "Next function start" })
    vim.keymap.set({ "n", "x", "o" }, "]c", goto_textobject("goto_next_start", "@class.outer"), { desc = "Next class start" })
    vim.keymap.set({ "n", "x", "o" }, "]M", goto_textobject("goto_next_end", "@function.outer"), { desc = "Next function end" })
    vim.keymap.set({ "n", "x", "o" }, "]C", goto_textobject("goto_next_end", "@class.outer"), { desc = "Next class end" })
    vim.keymap.set({ "n", "x", "o" }, "[m", goto_textobject("goto_previous_start", "@function.outer"), { desc = "Previous function start" })
    vim.keymap.set({ "n", "x", "o" }, "[c", goto_textobject("goto_previous_start", "@class.outer"), { desc = "Previous class start" })
    vim.keymap.set({ "n", "x", "o" }, "[M", goto_textobject("goto_previous_end", "@function.outer"), { desc = "Previous function end" })
    vim.keymap.set({ "n", "x", "o" }, "[C", goto_textobject("goto_previous_end", "@class.outer"), { desc = "Previous class end" })
  '';
}
