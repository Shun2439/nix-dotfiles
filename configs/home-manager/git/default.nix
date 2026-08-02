{ ... }:
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
      core.editor = "nv";
      core.autocrlf = false;
    };
    signing = {
      key = "C16DBB4D559C7413";
      signByDefault = true;
    };
  };
}
