{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    extraConfig = builtins.readFile ./.tmux.conf;
  };
}
