{ config, lib, pkgs, ... }:

let
  # Catppuccin Mocha Palette
  # See https://github.com/catppuccin/catppuccin#-palettes
  # Define colors as a separate attribute set
  catppuccinMocha = {
    rosewater = "#f5e0dc";
    flamingo = "#f2cdcd";
    pink = "#f5c2e7";
    mauve = "#cba6f7";
    red = "#f38ba8";
    maroon = "#eba0ac";
    peach = "#fab387";
    yellow = "#f9e2af";
    green = "#a6e3a1";
    teal = "#94e2d5";
    sky = "#89dceb";
    sapphire = "#74c7ec";
    blue = "#89b4fa";
    lavender = "#b4befe";
    text = "#cdd6f4";
    subtext1 = "#bac2de";
    subtext0 = "#a6adc8";
    overlay2 = "#9399b2";
    overlay1 = "#7f849c";
    overlay0 = "#6c7086";
    surface2 = "#585b70";
    surface1 = "#45475a";
    surface0 = "#313244";
    base = "#1e1e2e";
    mantle = "#181825";
    crust = "#11111b";
  };
in {
  # Enable Starship
  programs.starship = {
    enable = true;
    # Using lib.mkForce to ensure our settings override any defaults
    settings = lib.mkForce {
      format = lib.mkForce "[░▒▓](bold $lavender)$username$hostname$directory$git_branch$git_status$cmd_duration$python$nix_shell$memory_usage$battery$time$line_break$character";
      add_newline = true;

      character = {
        success_symbol = "[❯](fg:${catppuccinMocha.green})";
        error_symbol = "[❯](fg:${catppuccinMocha.red})";
        vicmd_mode_symbol = "[❮](fg:${catppuccinMocha.lavender})";
      };

      username = {
        show_always = true;
        format = "[ $user]($style)[](fg:${catppuccinMocha.lavender} bg:${catppuccinMocha.sapphire})";
        style_user = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.lavender} bold";
        style_root = "fg:${catppuccinMocha.red} bg:${catppuccinMocha.base} bold";
      };

      hostname = {
        ssh_only = false;
        format = "[ @$hostname]($style)[](fg:${catppuccinMocha.sapphire} bg:${catppuccinMocha.blue})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.sapphire} bold";
        trim_at = ".local";
      };

      directory = {
        format = "[ $path]($style)[$read_only]($read_only_style)[](fg:${catppuccinMocha.blue} bg:${catppuccinMocha.pink})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.blue} bold";
        read_only_style = "fg:${catppuccinMocha.red}";
        truncation_length = 3;
        truncation_symbol = "…/";
        fish_style_pwd_dir_length = 1;
      };

      git_branch = {
        symbol = " ";
        format = "[ $symbol$branch]($style)[](fg:${catppuccinMocha.pink} bg:${catppuccinMocha.yellow})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.pink} bold";
      };

      git_status = {
        disabled = true;
        format = "( $all_status$ahead_behind)[](fg:${catppuccinMocha.pink} bg:${catppuccinMocha.yellow})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.pink} bold";
        conflicted = "=";
        # ahead = "↑${count}";
        # behind = "↓${count}";
        diverged = "⇕$ahead_count$behind_count";
        untracked = "?";
        stashed = "$";
        modified = "!";
        staged = "+";
        renamed = "»";
        deleted = "✘";
      };

      cmd_duration = {
        min_time = 500;
        format = "[ $duration]($style)[](fg:${catppuccinMocha.yellow} bg:${catppuccinMocha.green})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.yellow} bold";
      };

      python = {
        symbol = "   R ";
        format = "[ $symbol($virtualenv)($version)]($style)[](fg:${catppuccinMocha.green} bg:${catppuccinMocha.teal})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.green} bold";
      };

      nix_shell = {
        format = "[ $symbol(NixOS)]($style)[](fg:${catppuccinMocha.base} bg:${catppuccinMocha.teal})";
        symbol = "❄";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.base} bold";
      };

      memory_usage = {
        disabled = false;
        threshold = -1;
        format = "[ $symbol$ram]($style)[](fg:${catppuccinMocha.teal} bg:${catppuccinMocha.green})";
        symbol = "󰍛 ";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.teal} bold";
      };

      battery = {
        disabled = false;
        format = "[ $symbol$percentage]($style)[](fg:${catppuccinMocha.green} bg:${catppuccinMocha.overlay1})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.green} bold";
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰂑 ";
        empty_symbol = "󰂎 ";
        display = [
          { threshold = 10; style = "bold fg:${catppuccinMocha.base} bg:${catppuccinMocha.red}"; }
          { threshold = 30; style = "bold fg:${catppuccinMocha.base} bg:${catppuccinMocha.yellow}"; }
          { threshold = 100; style = "bold fg:${catppuccinMocha.base} bg:${catppuccinMocha.green}"; }
        ];
      };

      time = {
        disabled = false;
        format = "[ $time]($style)[](fg:${catppuccinMocha.overlay1} bg:${catppuccinMocha.base})";
        style = "fg:${catppuccinMocha.surface0} bg:${catppuccinMocha.overlay1} bold";
        use_truncated_time = false;
        time_format = "%R"; # H:M format
      };
    };
  };
}
