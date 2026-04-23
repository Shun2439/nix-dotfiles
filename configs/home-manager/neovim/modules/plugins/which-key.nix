{ ... }:
{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>f";
          group = "find";
          icon = "󰈞 ";
        }
        {
          __unkeyed-1 = "<leader>s";
          group = "search";
          icon = " ";
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
          icon = " ";
        }
        {
          __unkeyed-1 = "g";
          group = "goto";
          icon = "󰈄 ";
        }
        {
          __unkeyed-1 = "<leader>p";
          group = "project";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>u";
          group = "Toggle";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>o";
          group = "Oil";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>m";
          group = "markdown";
          icon = " ";
        }
        {
          __unkeyed-1 = "<leader>c";
          group = "Edit";
          icon = "󱇧 ";
        }
        {
          __unkeyed-1 = "<leader>N";
          group = "Neovim News";
          icon = "󰎕 ";
        }
        {
          __unkeyed-1 = "<leader>/";
          group = "Grep";
          icon = "󱎸 ";
        }
        {
          __unkeyed-1 = "<leader>:";
          group = "Command History";
          icon = " ";
        }
      ];
    };
  };
}
