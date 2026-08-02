{ ... }:
{
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  boot.kernel.sysctl."vm.mmap_min_addr" = 65536;
}
