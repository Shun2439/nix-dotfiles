{ pkgs, ... }:
{
  fonts = {
    # DejaVu / Liberation / FreeFont / Unifont と Noto CJK / Noto Color Emoji を含む
    enableDefaultPackages = true;

    packages = with pkgs; [
      moralerspace-hw # Nerd Fonts のアイコンを同梱 (v2.0.0)

      # Emacs / TeX
      texlivePackages.haranoaji
      texlivePackages.euler-math

      ipaexfont # Zed の ui_font_family
      d2coding # ハングルの等幅フォールバック (Moralerspace にハングルは無い)
      biz-ud-gothic # 日本語 UI
      source-sans # 欧文 UI
      pretendard-jp # 韓国語 UI

      helvetica-neue-lt-std
    ];

    fontDir.enable = true;

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Harano Aji Mincho"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Source Sans 3"
          "BIZ UDGothic"
          "Pretendard JP"
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];
        monospace = [
          "Moralerspace Radon HW"
          "D2Coding"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
