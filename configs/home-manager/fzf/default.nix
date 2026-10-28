{ ... }:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    # enableFishIntegration = true;

    # fish の Ctrl-R は atuin に譲る（Ctrl-T / Alt-C は fzf のまま）
    historyWidget.fish.command = "";
  };
}
