{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";
      "$subMod" = "ALT";
      "$term" = "wezterm";

      bind = [
        # "$mainMod, Return, exec, ${open-terminal}/bin/open-terminal"
        "$mainMod, Return, exec, $term"

        "$mainMod, CTRL, right, workspace, m+1"
        "$mainMod, CTRL, left, workspace, m-1"
        "$mainMod, mouse_down, workspace, m+1"
        "$mainMod, mouse_up, workspace, m-1"
      ];

      bindm = [
      # mouse movements
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}

