{ pkgs, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    settings = {
      # 1. 全体設定
      add_newline = false; # ターミナルは一行で表示
      scan_timeout = 10;

      # 2. プロンプトのフォーマット定義
      format = lib.concatStrings [
        # OSシンボルと最初の区切り
        "$os"
        "$shell"

        # ディレクトリ
        "[](fg:#629dd6)" # ディレクトリの区切り (青)
        "$directory"

        # Gitステータス
        "[](fg:#4a824e bg:#629dd6)" # Gitモジュールへの区切り (緑 on 青)
        "$git_branch"
        "$git_status"

        # 言語モジュール (Node.js, Rustなどを代表として使用)
        "[](fg:#1a1b26 bg:#4a824e)" # 言語モジュールへの区切り (背景色 on 緑)
        "$nodejs"
        "$rust"

        # コマンドの実行時間
        "[](fg:#629dd6 bg:#1a1b26)" # 実行時間への区切り (青 on 背景色)
        "$cmd_duration"

        # 右側のモジュール（表示されない場合はコメントアウト）
        # "$all"

        # 改行と文字のプロンプト
        "$line_break"
        "$character"
      ];

      # 3. モジュールごとのカスタマイズ

      # ディレクトリ設定
      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        # ディレクトリ名: 明るい青 on ターミナル背景色
        style = "fg:#ffffff bg:#629dd6";
        format = "[ $path ]($style)";
      };

      # Git ブランチ
      git_branch = {
        symbol = ""; # Gitアイコン
        style = "fg:black bg:#4a824e"; # 文字色:黒 on 背景色:濃い緑
        format = "[ $symbol $branch ]($style)";
      };

      # Git ステータス
      git_status = {
        style = "fg:#ffffff bg:#4a824e"; # 白 on 濃い緑
        format = "[[($all_status$ahead_behind )](fg:white bg:#4a824e)]($style)";
        stashed = " 📦";
        conflicted = " 💥";
        modified = " ";
        untracked = " ";
      };

      # OS シンボル (Fish/Bashの場合は表示されないことも多い)
      os = {
        format = "[$symbol]($style)";
        style = "bold white";
        symbol = ""; # Linuxアイコン
        disabled = false;
      };

      # Node.js
      nodejs = {
        symbol = "";
        style = "fg:#c678dd bg:#1a1b26"; # 紫 on 背景色
        format = "[[ $symbol ($version) ](fg:white bg:#1a1b26)]($style)";
      };

      # Rust
      rust = {
        symbol = "🦀";
        style = "fg:#c678dd bg:#1a1b26";
        format = "[[ $symbol ($version) ](fg:white bg:#1a1b26)]($style)";
      };

      # コマンド実行時間
      cmd_duration = {
        min_time = 500;
        style = "fg:#98c379 bg:#1a1b26"; # 明るい緑 on 背景色
        format = "[  $duration ]($style)";
      };

      # 4. キャラクター設定 (プロンプトの最終行)
      character = {
        # 成功時は明るい青の矢印
        success_symbol = "[](bold #629dd6)";
        # エラー時は鮮やかな赤の矢印
        error_symbol = "[](bold #e06c75)";

        # 二行目に移るため、文字本体は空欄にする
        format = "$symbol";
      };
    };
  };
}
