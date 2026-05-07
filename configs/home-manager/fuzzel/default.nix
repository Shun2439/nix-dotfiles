{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Moralerspace Radon HW:size=7";
        # prompt = "❯   ";
        terminal = "foot";
        line-height = 12;
        fields = "name,generic,comment,categories,filename,keywords";
        width = 40;
        horizontal-pad = 20;
        vertical-pad = 15;
        inner-pad = 10;
      };

      colors = {
        background = "1e1e2ecc"; # #1e1e2e Base <- hex(int(255 * 0.8))
        text = "cdd6f4ff";       # #cdd6f4 Text
        match = "f38ba8ff";      # #f38ba8 Red
        selection = "585b70ff";  # #585b70 Surface 2
        selection-text = "cdd6f4ff"; # #cdd6f4 Text
        selection-match = "f38ba8ff"; # #f38ba8 Red
        border = "b4befeff";     # #b4befe Lavender
      };

      border = {
        width = 2;
        radius = 10;
      };
    };
  };
}
