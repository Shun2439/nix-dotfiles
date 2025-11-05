{pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Shun2439";
        email = "shunta.kobayashi24@gmail.com";
      };

      init.defaultBranch = "main";
      commit.gpgsign = true;
      core.editor = "vim";
      core.autocrlf = "true";
    };
    signing = {
      key = "C16DBB4D559C7413";
      signByDefault = true;
    };
  };
  programs.gpg.enable = true;
  # services.pcscd.enable = true;
  # services.gpg-agent = {
  #   enable = true;
  #   pinentryPackage = curses;
  #   enableSshSupport = true;
  #   enableFishIntegration = true;
  # };
  # programs.pinentry.enable = true;
}

