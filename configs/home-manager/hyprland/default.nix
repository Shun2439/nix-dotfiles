{ config, pkgs, inputs, ... }: 
{
  imports = [
    ./settings.nix
    ./key-binds.nix
    ./wofi.nix
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
  };
}

