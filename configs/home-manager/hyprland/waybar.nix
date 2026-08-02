{ ... }:
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./nord.css;
  };
}
