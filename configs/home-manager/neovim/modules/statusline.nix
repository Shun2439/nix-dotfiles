# Status line configuration (lualine)
{ ... }:
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "catppuccin";
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = [ ];
          winbar = [ ];
        };
        ignore_focus = [ ];
        always_divide_middle = true;
        globalstatus = false;
        refresh = {
          statusline = 1000;
          tabline = 1000;
          winbar = 1000;
        };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diff"
          "diagnostics"
        ];
        lualine_c = [
          "filename"
        ];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
          {
            __raw = "function() return vim.fn['skkeleton#mode']() end";
          }
        ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ];
        lualine_z = [ ];
      };
      tabline = { };
      winbar = { };
      inactive_winbar = { };
      extensions = [ ];
    };
  };
}
