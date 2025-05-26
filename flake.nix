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

    hyprsome.url = "github:sopa0/hyprsome";
  };

  outputs = inputs: {
    nixosConfigurations = {
      kilimanjaro = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/nixos/kilimanjaro
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
          ./homes/nixos/kilimanjaro
        ];
      };
    };
  };
}

