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
}