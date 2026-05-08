{ pkgs, ... }:
{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
        Hostname github.com
        User git
        IdentityFile ~/.ssh/id_ed25519_github

      Host codeberg.org
        Hostname codeberg.org
        User git
        IdentityFile ~/.ssh/id_ed25519_codeberg
    '';
  };
}
