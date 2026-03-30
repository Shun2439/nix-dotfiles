# Theme and colorscheme configuration
{ ... }:
{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integration = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
        };
        transparent_background = true;
      };
    };

    plugins = {
      colorizer = {
        enable = true;
        settings = {
          filetypes = { };
          user_default_options = {
            hsl_fn = true;
            rgb_fn = true;
            tailwind = true;
          };
        };
      };
    };
  };
}
