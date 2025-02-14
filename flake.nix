{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

		home-manager = {

			url = "github:nix-community/home-manager";

			inputs.nixpkgs.follows = "nixpkgs";

		};
	};

	outputs = inputs: {
		homeConfigurations = {

			myHome = inputs.home-manager.lib.homeManagerConfiguration {

				pkgs = import inputs.nixpkgs {

					system = "x86_64-linux";
				};

				extraSpecialArgs = {

					inherit inputs;

				};

				modules = [

					./home.nix

				];

			};

		};
	};
}

