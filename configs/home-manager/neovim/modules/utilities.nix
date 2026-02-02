{ ... }:
{
  programs.nixvim.plugins = {
    autoclose.enable = true;
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
        bigfile = { enabled = true; };
        dashboard = { enabled = false; }; # TODO
        explorer = { enabled = true; };
        terminal = { enabled = true; };
        lazygit = { enabled = true; };
        notifier = { enabled = true; };
        picker = { enabled = true; };
        indent = { enabled = true; };
        input = { enabled = true; };
        scope = { enabled = true; };
        scroll = { enabled = true; };
        statuscolumn = { enabled = true; };
        words = { enabled = true; };
        zen = { enabled = true; };
        quickfile = { enabled = true; };
        
        git = { enabled = true; };
        gitbrowse = { enabled = true; };
        gh = { enabled = true; };
        toggle = { enabled = true; };
        win = { enabled = true; };
        
        util = { enabled = true; };
        scratch = { enabled = true; };
        dim = { enabled = true; };
        rename = { enabled = true; };
        profiler = { enabled = true; };
        image = { enabled = true; };
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
  };
}
