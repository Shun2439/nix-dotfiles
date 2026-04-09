{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      denops-vim
      (pkgs.vimUtils.buildVimPlugin {
        name = "skkeleton";
        src = pkgs.fetchFromGitHub {
          owner = "vim-skk";
          repo = "skkeleton";
          rev = "158ae753bc5099ab12537c23152926c42b1f7c3a";
          hash = "sha256-Ee55oGlNCoKwvDxaJyRCjqY89+DU2bP+7t8o/kkh8lU=";
        };
      })
    ];

    extraConfigLua = ''
      vim.fn["skkeleton#config"]({
        eggLikeNewline = true,
        globalDictionaries = {
          { "${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L", "euc-jp" },
        },
        userDictionary = "~/.skkeleton",
      })
    '';
  };
}
