{ ... }:
{
  programs.nixvim.plugins.project-nvim = {
    enable = true;
    enableTelescope = true;
    settings = {
      lsp = {
        enabled = true;
      };
      patterns = [
        ".git"
      ];
      show_hidden = true;
      silent_chdir = false;
    };
  };
}
