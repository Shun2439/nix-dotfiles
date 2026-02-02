# Utilities and quality of life plugins
{ ... }:
{
  programs.nixvim.plugins = {
    # Auto close brackets, quotes, etc.
    autoclose.enable = true;
    
    # Surround actions
    vim-surround.enable = true;
    
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
        level = 1;  # 1 = INFO level
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
        on_open = null;
        on_close = null;
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

    # Better terminal
    toggleterm = {
      enable = true;
      # lazyLoad.enable = true;
      settings = {
        direction = "float";
        float_opts = {
          border = "curved";
          height = 30;
          width = 130;
        };
        open_mapping = "[[<C-t>]]";
        size = 20;
      };
    };

    # Enhanced lazygit integration - temporarily disabled
    lazygit = {
      enable = true;
      # lazyLoad.enable = true;
      settings = {
        floating_window_border_chars = [
          "╭"
          "─"
          "╮"
          "│"
          "╯"
          "─"
          "╰"
          "│"
        ];
        floating_window_scaling_factor = 0.9;
        floating_window_use_plenary = 0;
        floating_window_winblend = 0;
        use_custom_config_file_path = 0;
        use_neovim_remote = 1;
      };
    };
  };
}
