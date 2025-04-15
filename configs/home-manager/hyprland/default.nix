{ config, pkgs, inputs, ... }: 
{
  imports = [
    ./key-binds.nix
  ];
    # home.packages =
    #   (with pkgs; [
    #     # hypr-helper

    #   ])
    #   ++ [
    #     inputs.hyprsome.packages.${pkgs.system}.default
    #   ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    # package = pkgs.hyperland;

    settings = {
      monitor = [
        # "HDMI-1, 1920x1080@75, 0x0, 1"
        # "VGA-1, 1920x1080@60, 1366x0, 1"
        "LDVS-1, 1366x768@60, 0x0, 1"
      ];
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
      "fcitx5 -D"
      # "hypr-helper start"
    ];
    misc = {
      disable_hyprland_logo = true;
    };
    input.kb_layout = "jp";
  };
  # ...
};
}

