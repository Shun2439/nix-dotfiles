# Status line configuration (lualine)
{ ... }:
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    options = {
      disabled_filetypes = {
        __unkeyed-1 = "startify";
        __unkeyed-2 = "neo-tree";
        statusline = [
          "dap-repl"
        ];
        winbar = [
          "aerial"
          "dap-repl"
          "neotest-summary"
        ];
      };
      globalstatus = true;
    };
    settings = {
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
        ];
        lualine_c = [
          "filename"
          "diff"
        ];
        lualine_x = [
          {
            __raw = "function() return vim.fn['skkeleton#mode']() end";
          }
          "diagnostics"
          "encoding"
          "fileformat"
          "filetype"
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ { __unkeyed-1 = "location"; } ];
      };
      tabline = { };
      winbar = { };
      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ];
        lualine_z = [ ];
      };
      inactive_winbar = { };
      extensions = [ ];
    };
  };
}
