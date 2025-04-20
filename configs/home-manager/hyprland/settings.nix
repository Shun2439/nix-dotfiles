{ inputs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      # "col.inactive_border" = "rgb(${colors.bg})";
      # "col.active_border" = "rgb(${colors.blue})";
      resize_on_border = true;
    };
    decoration = {
      rounding = 10;
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

