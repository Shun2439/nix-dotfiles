{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style =
      (builtins.readFile ./mocha.css) +
      (builtins.readFile ./catppuccin.css);

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # modules-left = [ "niri/workspaces" "niri/window" ];
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right = [ "pulseaudio" "network" "cpu"  "memory" "temperature" "battery" "clock" "tray" "custom/lock" "custom/power" ];
        "niri/workspaces" = {
          # "disable-scroll" = true;
          # "sort-by-name" = true;
          format = "{icon}";
          format-icons = {
            default = "";
            active = "󰮯";
          };
        };

        "niri/window" = {
          format = "{}";
          separate-outputs = true;
        };

        "network" ={
          # format-wifi = "{icon} {essid}({signalStrength}%)";
          format-wifi = "{icon} {essid}";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };
        
        "cpu" = {
          "format" = "{icon0} {icon1} {icon2} {icon3} {icon4} {icon5} {icon6} {icon7}";
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };

        "memory" = {
          format = " {percentage}%";
        };

        "temperature" = {
          format = "󱩅 {temperatureC}°C";
        };

        # IME?
        "tray" = {
          icon-size = 13;
          spacing = 10;
        };
        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          # tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} / {{ title }}'";
          on-click = "playerctl play-pause";
          # max-length = 50;
        };
        "clock" = {
          timezone = "Asia/Tokyo";
          # "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          format-alt = " {:%Y/%m/%d}";
          format = " {:%H:%M}";
        };
        "backlight" = {
          # "device" = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = ["" "" "" "" "" "" "" "" ""];
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱐥 {capacity}%";
          # "format-alt" = "{icon}";
          format-icons = [ "󰂃 " "󰁺 " "󰁻 " "󰁼 " "󰁽 " "󰁾 " "󰁿 " "󰂀 " "󰂁 " "󰂂 " "󰁹 " ];
        };
        "pulseaudio" = {
          "scroll-step" = 1; # %, can be a float
          format = "{icon} {volume}%";
          format-muted = "";
          format-icons = {
            default = ["" "" " "];
          };
          on-click = "pavucontrol-qt";
        };
        "custom/lock" = {
          tooltip = false;
          on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
          # on-click = "swaylock";
          format = "";
        };
        "custom/power" = {
          # tooltip = false;
          # on-click = "wlogout &";
          on-click = "wlogout";
          format = "";
        };
      };
    };
  };
}

