{ inputs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 5;
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        xray = true;
        ignore_opacity = true;
        new_optimizations = true;
      };
    };

    env = [
      "GTK_IM_MODULE, fcitx"
      "QT_IM_MODULE, fcitx"
      "XMODIFIERS, @im=fcitx"
    ];
    exec-once = [
      "swww init && swww img ~/.config/hypr/wallpaper/main.jpg"
      "waybar"
      "fcitx5 -D"
      # "hypr-helper start"
    ];
    misc = {
      disable_hyprland_logo = true;
    };
  };
}

