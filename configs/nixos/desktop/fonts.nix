{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-emoji

      nerd-fonts.hack # error?

      ipafont

      # (pkgs.callPackage (fetchFromGitHub {
      #   owner = "yuru7";
      #   repo = "moralerspace";
      #   rev = "main";
      #   sha256 = "sha256-UMLC9fuGxUbA2k7yAOlXjeQBswXkb4t6b3r62mQph4o=";
      # }) {}) # not worked
    ];

    fontDir.enable = true;

    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];
        monospace = [
          "Hack Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
