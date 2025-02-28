{ pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      # builtins.readFile ./starship.toml;
      add_newline = false;
      format = lib.concatStrings [
        "$shell"
        "$os"
        "$all"
        "$line_break"
        # "$package"
        # "$line_break"
        "$character"
      ];
      shell.disabled = false;
      os = {
        format = "on $symbol";
        style = "bold blue";
        disabled = false;
      };
      scan_timeout = 10;
      character = {
        success_symbol = "[\\(￣▽￣\\)](bold green)";
        error_symbol = "[\\(￣へ￣\\)](bold red)";
      };
    };
  };
}
