# Syntax highlighting and code parsing
{ ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-space>";
          node_incremental = "<C-space>";
          scope_incremental = "<C-s>";
          node_decremental = "<C-backspace>";
        };
      };
      indent = {
        enable = true;
      };
    };
    ensureInstalled = [
      "bash"
      "c"
      "cpp"
      "css"
      "html"
      "javascript"
      "json"
      "lua"
      "markdown"
      "nix"
      "python"
      "rust"
      "toml"
      "typescript"
      "vim"
      "yaml"
    ];
  };

  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
        };
      };
      move = {
        enable = true;
        set_jumps = true;
        goto_next_start = {
          "]m" = "@function.outer";
          "]c" = "@class.outer";
        };
        goto_next_end = {
          "]M" = "@function.outer";
          "]C" = "@class.outer";
        };
        goto_previous_start = {
          "[m" = "@function.outer";
          "[c" = "@class.outer";
        };
        goto_previous_end = {
          "[M" = "@function.outer";
          "[C" = "@class.outer";
        };
      };
    };
  };
}