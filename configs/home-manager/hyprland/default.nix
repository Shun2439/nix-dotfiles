{ config, pkgs, inputs, ... }: 
{
  imports = [
    ./settings.nix
    ./key-binds.nix
    ./wofi.nix
    ./waybar.nix
  ];

  home.packages =
    (with pkgs; [
      # hypr-helper
      alsa-utils
      pamixer
      playerctl

      wl-clipboard

      swww

      grimblast
    ])
    ++ [
      inputs.hyprsome.packages.${pkgs.system}.default
    ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.cliphist.enable = true;

  home.file = {
    "main.jpg" = {
      target = ".config/hypr/wallpaper/main.jpg";
      source = pkgs.fetchurl {
        url = "https://www.yamaha.com/ja/about/experience/wallpaper/previous-wallpaper/images/2020/1920x1080_5-6.jpg";
        sha256 = "sha256-vt5FBYlKdBruMj3VNMT5aXn8vvteIkvEYPwNU3c3Ofg=";
      };
    };
  };
}

