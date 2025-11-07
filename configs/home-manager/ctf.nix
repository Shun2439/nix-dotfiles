{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # open-jdk
    ghidra

    file
    unzip
    binwalk

    pwninit
    pwntools
	];
}

