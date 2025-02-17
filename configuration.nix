{ config, pkgs, modulesPath, ... }:
{
  imports = [
    # https://github.com/ryan4yin/nixos-and-flakes-book/issues/164#issuecomment-2185407390
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
    # (modulesPath + "/installer/virtualbox-demo.nix")
  ];

# Let demo build as a trusted user.
# nix.settings.trusted-users = [ "demo" ];

# Mount a VirtualBox shared folder.
# This is configurable in the VirtualBox menu at
# Machine / Settings / Shared Folders.
# fileSystems."/mnt" = {
#   fsType = "vboxsf";
#   device = "nameofdevicetomount";
#   options = [ "rw" ];
# };

# By default, the NixOS VirtualBox demo image includes SDDM and Plasma.
# If you prefer another desktop manager or display manager, you may want
# to disable the default.
# services.xserver.desktopManager.plasma5.enable = lib.mkForce false;
# services.displayManager.sddm.enable = lib.mkForce false;

# Enable GDM/GNOME by uncommenting above two lines and two lines below.
# services.xserver.displayManager.gdm.enable = true;
# services.xserver.desktopManager.gnome.enable = true;

# Set your time zone.
time.timeZone = "Asia/Tokyo";

# List packages installed in system profile. To search, run:
# \$ nix search wget
# environment.systemPackages = with pkgs; [
#   wget vim
# ];

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# https://devctrl.blog/posts/step-by-step-guide-installing-nix-os-on-virtual-box/
users.groups.demo = {};
users.users.demo = {
  isNormalUser = true;
  group = "demo";
  extraGroups = [ "wheel" ];
  shell = pkgs.fish;
};

nix = {
  settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
  };
  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
};

services.xserver = {
  enable = true;

  windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = builtins.readFile ./configs/xmonad/xmonad.hs;

  # flake = {
  #   enable = true;
  #   # prefix = "unstable";
  #   compiler = "ghc924";
  # };
};
};

programs = {
  git = {
    enable = true;
  };
  vim = {
    enable = true;
    defaultEditor = true;
  };
  starship = {
    enable = true;
  };
  fish = {
    enable = true;
  };
  tmux = {
    enable = true;
  };
};

fonts = {
  fonts = with pkgs; [
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji

    MoralerspaceRadonHWNF
  ];
  fontDir.enable = true;
  fontconfig = {
    defaultFonts = {
      serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
      sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
};
}

