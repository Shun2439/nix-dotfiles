# File explorer plugins (oil.nvim)
{ ... }:
{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      columns = [ "icon" "size" "mtime" ];
      skip_confirm_for_simple_edits = true;
      delete_to_trash = true;
      use_default_keymaps = true;
      win_options = {
        wrap = false;
        signcolumn = "no";
      };
      view_options = {
        show_hidden = false;
        natural_order = true;
      };
      float = {
        padding = 2;
        border = "rounded";
      };
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