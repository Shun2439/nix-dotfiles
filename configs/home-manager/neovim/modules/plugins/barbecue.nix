{ ... }:
{
  programs.nixvim.plugins.barbecue = {
    enable = true;
    settings = {
      show_modified = true;
    };
  };
}
