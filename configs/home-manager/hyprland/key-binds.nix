{ pkgs, lib, ... }:
let
  open-terminal = 
    pkgs.writeScriptBin "open-terminal"
    # bash
    ''
    hyprctl dispatch exec wezterm
    '';
  ws-switch =
    pkgs.writeScriptBin "ws-switch"
    # bash
    ''
      monitor=$(hyprctl activeworkspace -j | jq .monitorID)
      hyprctl dispatch workspace $(($monitor * 10 + $1))
    '';
  ws-move =
    pkgs.writeScriptBin "ws-switch"
    # bash
    ''
      monitor=$(hyprctl activeworkspace -j | jq .monitorID)
      hyprctl dispatch movetoworkspace $(($monitor * 10 + $1))
    '';
  open-wofi =
    pkgs.writeScriptBin "open-wofi"
      # bash
    ''
      wofi --show drun --width 512px
    '';
in
{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$subMod" = "ALT";
    "$term" = "wezterm";

    bind = [
      # general
      "$mainMod SHIFT, Q, exit"

      # focus
      "$subMod, Tab, cyclenext"
      "$subMod SHIFT, Tab, cyclenext, prev"
      "$mainMod SHIFT, Return, exec, ${open-terminal}/bin/open-terminal"

      # workspace
      "$mainMod CTRL, right, workspace, m+1"
      "$mainMod CTRL, left, workspace, m-1"
      "$mainMod, mouse_down, workspace, m+1"
      "$mainMod, mouse_up, workspace, m-1"

      # window
      "$mainMod SHIFT, right, movetoworkspace, m+1"
      "$mainMod SHIFT, left, movetoworkspace, m-1"

      # system
      "$mainMod, x, exec, systemctl suspend"

      # launcher
      "$mainMod SHIFT, P, exec, ${open-wofi}/bin/open-wofi"
      "$mainMod, period, exec, wofi-emoji"
    ] ++ (
      lib.flatten (
        lib.genList (n:
          let
            wsNum = n + 1;
            key = if wsNum == 10 then "0" else toString wsNum;
          in
          [
            # switch workspace
            "$mainMod, ${key}, exec, ${ws-switch}/bin/ws-switch ${toString wsNum}"
            # move window to workspace
            "$mainMod SHIFT, ${key}, exec, ${ws-move}/bin/ws-move ${toString wsNum}"
          ]
        ) 10
      )
    );

    bindm = [
      # mouse movements
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}

