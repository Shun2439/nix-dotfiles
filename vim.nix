{pkgs, ...}: {
	programs.vim = {
		enable = true;
		# extraLuaConfig = builtins.readFile ./init.lua;
	};
}

