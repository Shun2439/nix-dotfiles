{ ... }:
{
  programs.nixvim.plugins.barbecue = {
    enable = false;
    settings = {
      show_modified = true;
    };
  };
}
