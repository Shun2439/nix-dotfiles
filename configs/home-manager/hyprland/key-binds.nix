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
    pkgs.writeScriptBin "ws-move"
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
  # monitor-switch = 
  #   pkgs.writeScriptBin "monitor-switch"
  #   # bash
  #   ''
  #     #!/bin/bash

  #     PRIMARY="LVDS-1"
  #     EXTERNAL="VGA-1"

  #     PRIMARY_STATE=$(hyprctl monitors all | grep "$PRIMARY" | grep -oE "(enabled|disabled)")
  #     EXTERNAL_STATE=$(hyprctl monitors all | grep "$EXTERNAL" | grep -oE "(enabled|disabled)")

  #     if [[ "$PRIMARY_STATE" == "enabled" && "$EXTERNAL_STATE" == "enabled" ]]; then
  #       # Extend mode, switch to external only
  #       hyprctl keyword monitor "$PRIMARY",disable
  #       hyprctl keyword monitor "$EXTERNAL",preferred,auto,1
  #     elif [[ "$PRIMARY_STATE" == "disabled" && "$EXTERNAL_STATE" == "enabled" ]]; then
  #       # External only, switch to primary only
  #       hyprctl keyword monitor "$PRIMARY",preferred,auto,1
  #       hyprctl keyword monitor "$EXTERNAL",disable
  #     else
  #       # Primary only or other state, switch back to extend
  #       hyprctl keyword monitor "$PRIMARY",preferred,0x0,1
  #       hyprctl keyword monitor "$EXTERNAL",preferred,auto,1920x0,1 # Adjust position as needed
  #     fi
  #   '';
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
      "$mainMod, l, exec, systemctl suspend"

      # launcher
      "$mainMod SHIFT, P, exec, ${open-wofi}/bin/open-wofi"
      "$mainMod, period, exec, wofi-emoji"

      # clipboard
      "$mainMod, v, exec, cliphist list | wofi -S dmenu | cliphist decode | wl-copy"

      # monitor
      # "$mainMod, p, exec, ${monitor-switch}/bin/monitor-switch"
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
    bindl = [
      # media control
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"

      # volume control: mute
      ", XF86AudioMute, exec, pamixer -t"
    ];
    bindle = [
      # volume control
      ", XF86AudioRaiseVolume, exec, pamixer -i 1"
      ", XF86AudioLowerVolume, exec, pamixer -d 1"

      # brightness control
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];
  };
}

