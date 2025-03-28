# https://nixos.wiki/wiki/Fcitx5
{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      # fcitx5-gtk
      fcitx5-skk
    ];
  };
}

