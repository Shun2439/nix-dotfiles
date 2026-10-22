# https://nixos.wiki/wiki/Fcitx5
{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-hangul
      (qt6Packages.fcitx5-chinese-addons)
      fcitx5-gtk
      fcitx5-skk
    ];
    fcitx5.waylandFrontend = true;
    fcitx5.settings.inputMethod = {
      "Groups/0" = {
        Name = "Group 1";
        "Default Layout" = "jp";
        DefaultIM = "keyboard-jp";
      };
      "Groups/0/Items/0" = {
        Name = "keyboard-jp";
        Layout = "jp";
      };
      "Groups/0/Items/1" = {
        Name = "keyboard-se";
        Layout = "se";
      };
      "Groups/0/Items/2" = {
        Name = "pinyin";
        Layout = "cn";
      };
      "Groups/0/Items/3" = {
        Name = "hangul";
        Layout = "kr";
      };
      "Groups/0/Items/4" = {
        Name = "skk";
        Layout = "jp";
      };
      GroupOrder = {
        "0" = "Group 1";
      };
    };
    fcitx5.ignoreUserConfig = true;
  };
}
