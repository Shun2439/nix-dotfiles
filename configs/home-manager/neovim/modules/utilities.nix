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
  };
}
