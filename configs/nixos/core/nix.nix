{ lib, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # wheel ユーザーが flake の nixConfig (extra-substituters / keys) を
    # 使えるようにする。これが無いと cachix の指定が無視される。
    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };
}
