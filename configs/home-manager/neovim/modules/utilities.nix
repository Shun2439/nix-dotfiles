{ ... }:
{
  programs.nixvim.plugins = {
    vim-surround.enable = true;
    nvim-autopairs.enable = true;

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

    snacks = {
      enable = true;
      settings = {
        # Core features
        animate = {
          enabled = true;

          duration = 20;
          easing = "linear";
          fps = 60;
        };
        bigfile = { enabled = true; };
        notifier = {
          enabled = true;
          timeout = 3000;
        };
        quickfile = { enabled = true; };
        statuscolumn = {
          enabled = true;

          left = [ "mark" "sign" ];
          right = [ "fold" "git" ];
          folds = {
            open = true;
            git_hl = true;
          };
          git = {
            patterns = [ "GitSign" "MiniDiffSign" ];
          };
          refresh = 50;
        };
        words = {
          debounce = 100;
          enabled = true;
        };

        dashboard = {
          enabled = true;
          sections = [
            {
              section = "terminal";
              # width: 50, height: 6
              cmd = "sh -c 'cat ${./logo.txt} | tte --anchor-canvas s --random-effect'";
              align = "center";
              # height = 17;
              # indent = 5;
              padding = 1;
            }
            # {
            #   # pane = 2;
            #   section = "header";
            # }
            {
              # pane = 2;
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              # pane = 2;
              icon = " ";
              section = "recent_files";
              title = "Recent Files";
              indent = 2;
              padding = 1;
            }
            {
              # pane = 2;
              icon = " ";
              section = "projects";
              title = "Projects";
              indent = 2;
              padding = 1;
            }
          ];
        };
        dim = { enabled = true; };
        explorer = {
          enabled = true;

          replace_netrw = true;
          trash = true;
        };
        lazygit = { enabled = true; };
        picker = { enabled = true; };
        indent = { enabled = true; };
        input = { enabled = true; };
        scope = { enabled = true; };
        scroll = { enabled = true; };
        terminal = {
          enabled = true;

          win = {
            style = "terminal";
            wo.winhighlight = "Normal:Normal,FloatBorder:FloatBorder";
          };
        };
        zen = { enabled = true; }; # ?
        
        git = { enabled = true; };
        win = { enabled = true; };
        
        util = { enabled = true; };
        scratch = { enabled = true; };
        image = { enabled = true; };

        gitbrowse = { enabled = true; };
        gh = { enabled = true; };
        toggle = { enabled = true; };

        rename = { enabled = true; };
        profiler = { enabled = true; };
      };
    };

    lazygit = {
      enable = true;
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

    ufo = {
      enable = true;
    };

    treesj = {
      enable = true;
      settings = {
        use_default_keymaps = false;
        max_join_length = 1024;
      };
      keymaps = {
        split = "gS";
        join = "gJ";
      };
    };
  };
}
