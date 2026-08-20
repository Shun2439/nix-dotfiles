{ ... }:
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
              id = "plugin:tailscale";
              defaultSettings = {
                compactMode = true;
                hideDisconnected = true;
                terminalCommand = "wezterm";
              };
            }
            {
              id = "plugin:cloudflare-warp";
            }
            {
              id = "Bluetooth";
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
            }
            {
              id = "plugin:monitor-layout";
            }
          ];
          center = [
            {
              id = "NotificationHistory";
              hideWhenZero = true;
            }
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
              defaultSettings = {
                tappyMode = true;
              };
            }
            {
              compactMode = false;
              diskPath = "/";
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
              hideIfNotDetected = true;
              id = "Battery";
              showNoctaliaPerformance = true;
              showPowerProfiles = true;
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
      audio = {
        volumeStep = 1;
      };
    };
    # this may also be a string or a path to a JSON file.
  };
  # };
}
