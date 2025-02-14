{pkgs, ...}: {
	home.packages = with pkgs; [
		gcc
		cmake
		ninja
		gdb
		#####
		deno
		#####
		rust-bin.stable.latest.default
	];
}

