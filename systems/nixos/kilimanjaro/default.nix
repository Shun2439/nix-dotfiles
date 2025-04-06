# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../../configs/nixos/core/tlp.nix
    ../../../configs/nixos/core/podman.nix

    ../../../configs/nixos/samba.nix

    ../../../configs/nixos/desktop/fcitx5.nix
    ../../../configs/nixos/desktop/fonts.nix
    ../../../configs/nixos/desktop/sound.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalization properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ja_JP.UTF-8";
    LC_IDENTIFICATION = "ja_JP.UTF-8";
    LC_MEASUREMENT = "ja_JP.UTF-8";
    LC_MONETARY = "ja_JP.UTF-8";
    LC_NAME = "ja_JP.UTF-8";
    LC_NUMERIC = "ja_JP.UTF-8";
    LC_PAPER = "ja_JP.UTF-8";
    LC_TELEPHONE = "ja_JP.UTF-8";
    LC_TIME = "ja_JP.UTF-8";
  };

  # Enable the LXQT Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.lxqt.enable = true;

  services.xserver = {
    enable = true;
    xrandrHeads = [
      {
        # output = "HDMI-1";
        output = "VGA-1";
        primary = true;
      }
      {
        output = "LVDS-1";
      }
    ];

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile ./../../../configs/nixos/desktop/xmonad/xmonad.hs;
      extraPackages =
        hpkgs: with hpkgs; [
          xmonad-contrib
          # dmenu # allowBroken?
        ];
    };
  };
  services.displayManager = {
    defaultSession = "none+xmonad";
    # sessionCommands = ''
    #             xrandr --output HDMI-1 --primary --mode 1920x1080 --rotate normal --right-of --output LVDS-1 --off
    #             ./.fehgb
    # '';
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "jp";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shun2439 = {
    isNormalUser = true;
    description = "Shun2439";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      #  thunderbird
      tlp

      mtpfs

      usbutils

      libdvdcss
      libdvdread
      libdvdnav
    ];

    shell = pkgs.fish;
    ignoreShellProgramCheck = true; # should not use home manager?
  };

  programs.gnupg.agent.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.gvfs.enable = true;

  services.tailscale.enable = true;

  networking.firewall = {
    enable = true;
    # tailscaleの仮想NICを信頼する
    # `<Tailscaleのホスト名>:<ポート番号>`のアクセスが可能になる
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  hardware.bluetooth.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    # wget
    nixfmt-rfc-style
    cifs-utils # samba mount

    # podman
    dive
    podman-tui
    docker-compose

    # Bluetooth
    bluez
    blueman

    qemu
  ];

  services.blueman.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
