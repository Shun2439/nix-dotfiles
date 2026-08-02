{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "Moralerspace Radon HW";
      theme = "Catppuccin Mocha";
      background-opacity = 0.75;
      background-blur = true;
      window-theme = "ghostty";
      copy-on-select = true;
      clipboard-write = "allow";
    };
  };
}
