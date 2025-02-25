{ pkgs, ... }:
{
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 80;  # Start charging below 80%
      STOP_CHARGE_THRESH_BAT0 = 85;   # Stop charging at 85%

      CHARGE_THRESH_ENABLE = 1;

      START_CHARGE_THRESH_AC = 75;
      STOP_CHARGE_THRESH_AC = 80;
    };
  };
}
