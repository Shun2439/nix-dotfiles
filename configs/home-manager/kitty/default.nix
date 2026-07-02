{ ... }:
{
  programs.kitty = {
    enable = true;
    font.name = "Moralerspace Radon HW";
    shellIntegration.enableFishIntegration = true;
    enableGitIntegration = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      hide_window_decorations = true;

      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      tab_bar_edge = "top";

      cursor_trail = 200;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
    };
  };
}
