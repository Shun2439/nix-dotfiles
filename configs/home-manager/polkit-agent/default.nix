{ pkgs, ... }:
{
  # niri / hyprland のように認証エージェントを自動起動しない
  # コンポジタ向け。compositor 側の spawn から "polkit-auth-agent" を呼ぶ。
  home.packages = [
    (pkgs.writeShellScriptBin "polkit-auth-agent" ''
      exec ${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1
    '')
  ];
}
