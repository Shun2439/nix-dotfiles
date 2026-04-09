# Git integration - temporarily disabled during snacks migration (commented out)
{ ... }:
{
  programs.nixvim.plugins = {
    # Git signs in gutter (snacks.git provides complementary features)
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = false;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
        };
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
        watch_gitdir = {
          follow_files = true;
        };
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
