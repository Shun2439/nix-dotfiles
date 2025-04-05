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

      emmet-vim

      # skk
    ];

    # emmet-vim = {
    #   enable = true;

    #   settings = {
    #     leader = "<C-Z>";
    #     mode = "inv"; # insert, normal, visual mode
    #     settings = {
    #       html = {
    #         default_attributes = {
    #           option = {
    #             value = null;
    #           };
    #           textarea = {
    #             cols = 10;
    #             id = null;
    #             name = null;
    #             rows = 10;
    #           };
    #         };
    #         snippets = {
    #           "html:5" = ''
    #           <!DOCTYPE html>
    #           <html lang=\"$\{lang}\">
    #           <head>
    #           \t<meta charset=\"$\{charset}\">
    #           \t<title></title>
    #           \t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    #           </head>
    #           <body>\n\t$\{child}|\n</body>
    #           </html>
    #           '';
    #           };
    #           };
    #           variables = {
    #           lang = "ja";
    #           };
    #           };
    #           };
    #           };
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

