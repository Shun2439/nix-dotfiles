{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    style = (builtins.readFile ./mocha.css) + (builtins.readFile ./catppuccin.css);

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        # modules-left = [ "niri/workspaces" "niri/window" ];
        modules-left = [ "niri/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "network"
          "cpu"
          "memory"
          "temperature"
          "battery"
          # "clock"
          "tray"
          "custom/lock"
          "custom/power"
        ];
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

        "bluetooth" = {
          format = " {status}";
          format-connected = " {device_alias}";
          # format-connected-battery = " {device_alias} {icon} {device_battery_percentage}%";
          format-connected-battery = " {device_alias} {icon}";
          format-icons = [
            "󰥇"
            "󰤾"
            "󰤿"
            "󰥀"
            "󰥁"
            "󰥂"
            "󰥃"
            "󰥄"
            "󰥅"
            "󰥆"
            "󰥈"
          ];
          on-click = "${pkgs.blueman}/bin/blueman-manager";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          # tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{icon}";
        };

        "network" = {
          format-wifi = "{icon} {essid}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        "cpu" = {
          format = "{icon} {usage}%";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        "memory" = {
          format = " {percentage}%";
        };

        "temperature" = {
          format = "{icon} {temperatureC}°C";
          format-icons = [
            "" # empty
            ""
            "" # half
            ""
            "" # full
          ];
        };

        # IME?
        "tray" = {
          icon-size = 13;
          spacing = 10;
        };
        "custom/music" = {
          format = " {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} / {{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
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
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          "format-alt" = "{time} remaining";
          format-icons = {
            default = [
              "󰂃"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            # charging = [
            plugged = [
              "󰢟"
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
          };
        };
        "pulseaudio" = {
          scroll-step = 1; # %, can be a float
          format = "{icon} {desc} {volume}%";
          format-muted = "";
          format-icons = {
            default = [
              ""
              ""
              " "
            ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        "custom/lock" = {
          tooltip = false;
          # on-click = "sh -c '(sleep 0.5s; swaylock --grace 0)' & disown";
          on-click = "swaylock --font 'Moralerspace Neon HW' --screenshot --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 89b4fa --key-hl-color f5e0dc --text-color cdd6f4 --line-color 00000000 --inside-color 1e1e2e88 --separator-color 00000000";
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
