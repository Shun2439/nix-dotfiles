{pkgs, ...}: {
	programs.git = {
		enable = true;
		userName = "Shun2439";
		userEmail = "shunta.kobayashi24@gmail.com";
		extraConfig = {
			init.defaultBranch = "main";
			core.editor = "vim";
			core.autocrlf = "true";
		};
	};
}

