# Git integration - temporarily disabled during snacks migration (commented out)
{ ... }:
{
  programs.nixvim.plugins = {
    # Git signs in gutter (snacks.git provides complementary features)
    gitsigns = {
      enable = false;
      settings = {
        current_line_blame = true;
        signcolumn = true;
        signs = {
          add = {
            text = "│";
          };
          change = {
            text = "│";
          };
          changedelete = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          untracked = {
            text = "┆";
          };
        };
        numhl = true;
        linehl = true;
        attach_to_untracked = true;
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
    # Git commands (snacks.gitbrowse and snacks.lazygit provide these)
    # fugitive.enable = false;
    # gitlinker = {
    #   enable = false;
    #   settings = {
    #     mappings = "<leader>gy";
    #   };
    # };
  };
}
