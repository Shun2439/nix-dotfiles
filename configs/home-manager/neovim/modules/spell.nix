# Built-in Neovim spell checking (no external checker at runtime).
#
# Vim's `spelllang' uses language codes ("sv", "ko"), while the hunspell
# dictionaries installed by configs/home-manager/emacs are named after locales
# ("sv_SE", "ko_KR").  Convert them to Vim .spl files at build time with
# `:mkspell`, which understands the hunspell .aff/.dic format.
{ pkgs, lib, ... }:
let
  spellSources = {
    sv = "${pkgs.hunspellDicts.sv_SE}/share/hunspell/sv_SE";
    ko = "${pkgs.hunspellDicts.ko_KR}/share/hunspell/ko_KR";
  };

  spellfiles = pkgs.runCommandLocal "nvim-spellfiles" { } ''
    mkdir -p $out
    ${lib.concatStringsSep "\n" (
      lib.mapAttrsToList (
        lang: source:
        # mkspell warns about hunspell-only directives (WORDCHARS, BREAK, ...);
        # the generated file is still valid, so keep the build log quiet.
        ''
          ${pkgs.neovim-unwrapped}/bin/nvim --headless -u NONE \
                    -c 'mkspell! $out/${lang} ${source}' -c 'qa!' >/dev/null 2>&1'') spellSources
    )}
  '';
in
{
  # "en" ships with Neovim; sv/ko come from `spellfiles` below.
  programs.nixvim.opts.spelllang = "en,sv,ko";

  # $XDG_DATA_HOME/nvim/site is part of 'runtimepath', so spell files placed
  # under site/spell are found without touching 'spellfile'.
  xdg.dataFile = lib.mapAttrs' (lang: _: {
    name = "nvim/site/spell/${lang}.utf-8.spl";
    value.source = "${spellfiles}/${lang}.utf-8.spl";
  }) spellSources;

  # Spell checking on for prose buffers only; <leader>us still toggles it.
  programs.nixvim.autoCmd = [
    {
      event = "FileType";
      pattern = [
        "markdown"
        "org"
        "tex"
        "gitcommit"
      ];
      callback.__raw = "function() vim.opt_local.spell = true end";
    }
  ];
}
