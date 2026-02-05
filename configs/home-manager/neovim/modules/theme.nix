# Theme and colorscheme configuration
{ ... }:
{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        background = {
          light = "latte";
          dark = "mocha";
        };
        transparent_background = false;
        show_end_of_buffer = false;
        integration = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
          notify = true;
          mini = true;
        };
      };
    };

    plugins = {
      colorizer = {
        enable = true;
        settings = {
          filetypes = {};
          user_default_options = {
            rgb_fn = true;
            hsl_fn = true;
            tailwind = true;
          };
        };
      };
    };
  };
}