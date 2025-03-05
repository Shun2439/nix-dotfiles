{pkgs, ...}:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      background = "dark";

      copyindent = true;

      expandtab = true;

      number = true;

      shiftwidth = 4;
      smartcase = true;
      tabstop = 4;
    };
    extraConfig = builtins.readFile ./.vimrc;
  };
}

