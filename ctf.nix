{pkgs, ...}: {
	home.packages = with pkgs; [
		open-jdk
		ghidra
	];
}

