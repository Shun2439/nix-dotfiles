# Git integration
{ ... }:
{
  programs.nixvim.plugins = {
    # Git signs in gutter
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = { text = "│"; };
          change = { text = "│"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
          untracked = { text = "┆"; };
        };
        current_line_blame = true;
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>";
        signcolumn = true;
        numhl = false;
        linehl = false;
        watch_gitdir = {
          follow_files = true;
        };
        attach_to_untracked = true;
        sign_priority = 6;
        update_debounce = 100;
        status_formatter = null;
        max_file_length = 40000;
        preview_config = {
          border = "rounded";
          style = "minimal";
          relative = "cursor";
          row = 0;
          col = 1;
        };
        trouble = false;
      };
    };

    # Git commands
    fugitive.enable = true;
    
    # GitHub integration
    gitlinker = {
      enable = true;
      settings = {
        mappings = "<leader>gy";
      };
    };
  };
}
