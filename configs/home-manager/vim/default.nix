{pkgs, ...}:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };
  home.file = {
    ".vimrc" = {
      target = ".vimrc";
      source = ./.vimrc;
    };
    ".vim" = {
      target = ".vim";
      source = ./.vim;
    };
  };
}

