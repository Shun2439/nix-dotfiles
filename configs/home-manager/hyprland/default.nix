{ config, pkgs, inputs, ... }: 
{
  imports = [
    ./settings.nix
    ./key-binds.nix
    ./wofi.nix
  ];

  home.packages =
    (with pkgs; [
      # hypr-helper
      pamixer
      playerctl
      wl-clipboard
    ])
    ++ [
      inputs.hyprsome.packages.${pkgs.system}.default
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.cliphist.enable = true;
}

