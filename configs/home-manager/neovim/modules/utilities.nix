# Utilities and quality of life plugins
{ ... }:
{
  programs.nixvim.plugins = {
    # Auto close brackets, quotes, etc.
    autoclose.enable = true;
    
    # Surround actions
    surround.enable = true;
    
    # Auto pairs
    nvim-autopairs.enable = true;
    
    # Comment plugin
    comment-nvim = {
      enable = true;
      settings = {
        padding = true;
        sticky = true;
        ignore = "";
        toggler = {
          line = "gcc";
          block = "gbc";
        };
        opleader = {
          line = "gc";
          block = "gb";
        };
        extra = {
          above = "gcO";
          below = "gco";
          eol = "gcA";
        };
        mappings = {
          basic = false;
          extra = false;
        };
      };
    };

    # Better notifications
    notify = {
      enable = true;
      settings = {
        level = "INFO";
        minimum_width = 50;
        maximum_width = 50;
        render = "default";
        stages = "slide";
        timeout = 3000;
        background_colour = "#000000";
        icons = {
          ERROR = "󰅚";
          WARN = "󰀪";
          INFO = "";
          DEBUG = "";
          TRACE = "✎";
        };
        on_open = nil;
        on_close = nil;
        fps = 60;
      };
    };

    # Indent guides
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│";
          tab_char = "│";
        };
        scope = {
          enabled = true;
          char = "│";
          show_start = false;
          show_end = false;
        };
        exclude = {
          filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
    };

    # Start screen
    alpha = {
      enable = true;
      layout = {
        type = "padding";
        val = 2;
      };
    };

    # Better terminal
    toggleterm = {
      enable = true;
      settings = {
        size = 20;
        open_mapping = [[ "<C-t>" ]];
        hide_numbers = true;
        shade_filetypes = {};
        shade_terminals = true;
        shading_factor = 2;
        start_in_insert = true;
        insert_mappings = true;
        persist_size = true;
        direction = "float";
        close_on_exit = true;
        shell = null;
        float_opts = {
          border = "curved";
          winblend = 0;
          highlights = {
            border = "Normal";
            background = "Normal";
          };
        };
      };
    };
  };
}