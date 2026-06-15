{ pkgs, inputs, ... }:
{
  # home-manager.users.drfoobar = {
  #   # import the home manager module
  #   imports = [
  #     inputs.noctalia.homeModules.default
  #   ];

  # configure options
  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        density = "compact";
        barType = "floating";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Volume";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
            {
              id = "MediaMini";
              showArtistFirst = false;
            }
          ];
          right = [
            {
              id = "plugin:slowbongo";
              defaultSSettings = {
                tappyMode = true;
              };
            }
            {
              compactMode = false;
              idskPath = "/";
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = true;
              showMemoryUsage = true;
              showSwapUsage = true;
              useMonospaceFont = true;
            }
            {
              alwaysShowPercentage = true;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes.predefinedScheme = "Catppuccin";
      general = {
        avatarImage = "/home/drfoobar/.face";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        autoLocate = true;
      };
    };
    # this may also be a string or a path to a JSON file.
  };
  # };
}
