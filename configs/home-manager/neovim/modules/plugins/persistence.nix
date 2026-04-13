{ ... }:
{
  programs.nixvim.plugins.persistence = {
    enable = true;
    settings = {
      branch = false;
      need = 0;
    };
  };
}
