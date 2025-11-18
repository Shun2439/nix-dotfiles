{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = catppuccin;
      }
    ];
    extraConfig = builtins.readFile ./.tmux.conf;
  };
}
