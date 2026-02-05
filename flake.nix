{
  inputs = {
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";

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

    hyprsome.url = "github:sopa0/hyprsome";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];
      flake =
      {
        overlays = {
          default = import inputs.rust-overlay;
          # rust-overlay = import inputs.rust-overlay;
        };
        lib = import ./lib inputs;

        nixosConfigurations = {
          kilimanjaro = inputs.nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./systems/nixos/kilimanjaro
            ];
          };
        };

        homeManagerModules.default = import ./modules/home-manager;
        homeConfigurations = {
          "shun2439@LAPTOP-N9FF5EU1" = self.lib.makeHomeManagerConfig {
            system = "x86_64-linux";
            username = "shun2439";
            modules = [
              ./modules/home-manager
            ];
          };
          "shun2439@kilimanjaro" = self.lib.makeHomeManagerConfig {
            system = "x86_64-linux";
            username = "shun2439";
            modules = [
              ./homes/nixos/kilimanjaro
            ];
          };
        };
      };
    };
}
  


