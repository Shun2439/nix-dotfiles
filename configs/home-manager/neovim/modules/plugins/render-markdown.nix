{ ... }:
{
  programs.nixvim.plugins.render-markdown = {
    enable = true;
    settings = {
      render_modes = true;
      code = {
        width = "block";
      };
      heading = {
        icons = [];
        left_pad = 0;
        right_pad = 4;
        width = "block";
      };
    };
  };
}
