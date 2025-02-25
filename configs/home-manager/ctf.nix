{pkgs, ...}:
{
	home.packages = with pkgs; [
    # open-jdk
		ghidra

    file
    unzip
    binwalk
    
    python3
    gef
    pwninit
    pwntools
	];
}

