{pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "Shun2439";
    userEmail = "shunta.kobayashi24@gmail.com";
    signing = {
      key = "C16DBB4D559C7413";
      signByDefault = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      core.editor = "vim";
      core.autocrlf = "true";
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

