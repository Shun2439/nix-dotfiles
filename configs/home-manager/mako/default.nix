{ ... }:
{
  services.mako = {
    enable = false;
    settings = {
      # source: https://github.com/catppuccin/mako/blob/main/themes/catppuccin-mocha/catppuccin-mocha-lavender

      font = "Noto Sans CJK JP";
      # font = "Moralerspace Neon HW";
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      # width = 300; # px
      # height = 100; # px
      # o
      # margin = 10;
      # p
      # b
      border-color = "#fab387";
      border-radius = 8;
      progress-color = "over #313244";
      icons = true;
      # m
      # i
      # ...

      # markup = true;
      # actions = true;
    };
    extraConfig = ''
      [urgency=high]
      border-color=#fab387
    '';
  };
}
