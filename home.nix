{pkgs, ...}: {
	imports = [
		./vim.nix
		./browser.nix
		./development.nix
		./git.nix
	];

	home = rec {
		username = "demo";
		homeDirectory = "/home/${username}";
		stateVersion = "22.11";

		packages = with pkgs; [
			git
			# vim
			fish
			bat
			# z
			eza
			fzf
		];
	};
	programs.home-manager.enable = true;
}

