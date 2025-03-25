{pkgs, ...}:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-devicons
      nord-vim

      # skk-vim

      denops-vim
      # denops-helloworld-vim

      # vim-healthcheck
      ddc-vim

      vim-fugitive
    ];
    settings = {
      background = "dark";

      copyindent = true;

      expandtab = true;

      ignorecase = true;

      number = true;

      shiftwidth = 4;
      smartcase = true;
      tabstop = 4;
    };
    extraConfig = builtins.readFile ./.vimrc;
  };
}

