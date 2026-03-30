# File explorer plugins (oil.nvim)
{ ... }:
{
  programs.nixvim.plugins = {
    oil = {
      enable = true;
      autoLoad = true;
      settings = {
        columns = [
          "icon"
        ];
        keymaps = {
          "<C-r>" = "actions.refresh";
          "<leader>qq" = "actions.close";
          "y." = "actions.copy_entry_path";
        };
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = true;
        };
        win_options = {
          signcolumn = "yes:2";
          wrap = false;
        };
        delete_to_trash = true;
        use_default_keymaps = true;
        float = {
          padding = 2;
          border = "rounded";
        };
      };
    };
    oil-git-status = {
      enable = true;
      autoLoad = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options = {
        silent = true;
        desc = "Open parent directory in oil";
      };
    }
  ];
}
