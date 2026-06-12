{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      nerd-fonts.hack # error?

      # Emacs
      symbola
      nerd-fonts.symbols-only

      ipaexfont


      (stdenvNoCC.mkDerivation rec {
        pname = "moralerspace";
        version = "2.0.0";
        src = fetchzip {
          url = "https://github.com/yuru7/moralerspace/releases/download/v${version}/MoralerspaceHW_v${version}.zip";
          hash = "sha256-gd195o0acZL8AhGvcLLQYxd1VWvUYjpVRMOT5D7zDME=";
        };
        installPhase = ''
          mkdir -p $out/share/fonts/truetype
          cp *.ttf $out/share/fonts/truetype/
        '';
      })

      texlivePackages.haranoaji
      texlivePackages.euler-math
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
          "Moralerspace Radon HW"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
