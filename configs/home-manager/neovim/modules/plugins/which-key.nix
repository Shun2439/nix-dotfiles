{ ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "find";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>g";
          group = "git";
          icon = "󰊢 ";
        }
        {
          __unkeyed-1 = "<leader>t";
          group = "terminal";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>b";
          group = "buffer";
        }
        {
          __unkeyed-1 = "g";
          group = "goto";
          icon = "󰈄 ";
        }
        {
          __unkeyed-1 = "p";
          group = "project";
          icon = " ";
        }
      ];
    };
  };
}
