{
  pkgs,
  ...
}:
{
  imports = [
    ../waybar # use noctalia
    ../fuzzel
    ../mako # use noctalia
  ];

  home.packages = with pkgs; [
    tlp
    oreo-cursors-plus
    (pkgs.writeShellScriptBin "monitor-switch"
      # bash
      ''
        set -euo pipefail

        internal="eDP-1"
        conf="$HOME/.config/niri/monitor.kdl"

        outputs_json="$(niri msg --json outputs)"
        mapfile -t all_outputs < <(printf '%s' "$outputs_json" | jq -r 'keys[]')

        is_on() {
          printf '%s' "$outputs_json" | jq -r --arg o "$1" '.[$o].current_mode != null'
        }

        externals=()
        internal_on=false
        external_on=false
        for o in "''${all_outputs[@]}"; do
          if [[ "$o" == "$internal" ]]; then
            [[ "$(is_on "$o")" == true ]] && internal_on=true
          else
            externals+=("$o")
            [[ "$(is_on "$o")" == true ]] && external_on=true
          fi
        done

        if [[ "$internal_on" == true && "$external_on" == true ]]; then
          mode="extend"
        elif [[ "$internal_on" == true ]]; then
          mode="internal"
        else
          mode="external"
        fi

        label() {
          case "$1" in
            extend) echo "Extend" ;;
            internal) echo "Internal only" ;;
            external) echo "External only" ;;
          esac
        }

        modes=(internal)
        if [[ "''${#externals[@]}" -gt 0 ]]; then
          modes=(extend internal external)
        fi

        menu=()
        for m in "''${modes[@]}"; do
          if [[ "$m" == "$mode" ]]; then
            menu+=("* $(label "$m")")
          else
            menu+=("  $(label "$m")")
          fi
        done

        chosen="$(printf '%s\n' "''${menu[@]}" | fuzzel -d --prompt='Display Mode > ')" || true
        [[ -z "$chosen" ]] && exit 0

        case "$chosen" in
          *Extend*) next="extend" ;;
          *Internal*) next="internal" ;;
          *External*) next="external" ;;
        esac

        case "$next" in
          extend)
            : > "$conf.tmp"
            ;;
          internal)
            : > "$conf.tmp"
            for o in "''${externals[@]}"; do
              printf 'output "%s" {\n    off\n}\n' "$o" >> "$conf.tmp"
            done
            ;;
          external)
            printf 'output "%s" {\n    off\n}\n' "$internal" > "$conf.tmp"
            ;;
        esac
        mv "$conf.tmp" "$conf"
        niri msg action load-config-file >/dev/null
      ''
    )

    # fuzzel
    # swaylock
    # swaylock-effects # use noctalia
    # swaybg # wallpaper
    # wlogout
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/monitor.kdl" = {
    text = "";
    force = true;
  };
}
