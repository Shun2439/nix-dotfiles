{ ... }:
{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;

    settings.enter_accept = false;
    forceOverwriteSettings = true;
  };
}
