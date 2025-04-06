{
  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay.url = "github:oxalica/rust-overlay";

    android-nixpkgs = {
      url = "github:tadfisher/android-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      kilimanjaro = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/nixos/kilimanjaro

          # home-manager.nixosModules.home-manager

          # {
          #   inputs.home-manager.users.myusername = { config, lib, pkgs, ... }: {
          #     imports = [
          #       import inputs.android-nixpkgs.hmModule

          #       {
          #         inherit config lib pkgs;
          #         android-sdk.enable = true;

          #         # Optional; default path is "~/.local/share/android".
          #         android-sdk.path = "${config.home.homeDirectory}/.android/sdk";

          #         android-sdk.packages = sdk: with sdk; [
          #           build-tools-34-0-0
          #           cmdline-tools-latest
          #           # emulator
          #           platforms-android-34
          #           sources-android-34
          #         ];
          #       }
          #     ];
          #   };
          # }
        ];
      };
    };
    homeConfigurations = {
      myHome = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";

          config.allowUnfree = true;

          overlays = [(import inputs.rust-overlay)];
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./modules/home-manager
        ];
      };
    };
  };
}

