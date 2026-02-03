# Git integration - temporarily disabled during snacks migration (commented out)
{ ... }:
{
  programs.nixvim.plugins = {
    # Git signs in gutter (snacks.git provides complementary features)
    gitsigns = {
      enable = false;
      settings = {
        signs = {
          add = {
            hl = "GitSignsAdd";
            text = "│";
          };
          change = {
            hl = "GitSignsChange";
            text = "│";
          };
          delete = {
            hl = "GitSignsDelete";
            text = "│";
          };
          topdelete = {
            hl = "GitSignsTopDelete";
            text = "‾";
          };
          changedelete = {
            hl = "GitSignsChangeDelete";
            text = "~";
          };
          untracked = {
            hl = "GitSignsUntracked";
            text = "│";
          };
        };
        signcolumn = false;
        numhl = true;
        linehl = true;
        current_line_blame = true;
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