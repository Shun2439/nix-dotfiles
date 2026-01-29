# Fuzzy finder and search functionality
{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-p>" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>fb" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>fr" = "oldfiles";
      "<leader>fc" = "git_commits";
      "<leader>fs" = "git_status";
      "<leader>fd" = "diagnostics";
    };
    settings = {
      defaults = {
        mappings = {
          i = {
            "<C-k>" = "move_selection_previous";
            "<C-j>" = "move_selection_next";
            "<C-q>" = "send_to_qflist";
            "<M-q>" = "send_selected_to_qflist";
          };
        };
        file_ignore_patterns = [
          "^.git/"
          "^.nix-defexpr/channels/"
          "result/"
          "node_modules/"
          "__pycache__/"
          "%.pyc"
        ];
      };
      pickers = {
        find_files = {
          hidden = true;
        };
      };
    };
  };

  # Telescope extensions
  programs.nixvim.plugins.telescope.extensions = {
    fzf-native.enable = true;
    file-browser.enable = true;
    ui-select.enable = true;
  };
}