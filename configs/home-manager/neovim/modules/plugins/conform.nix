{ ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;

    # Pull the formatter executables from Nix into the wrapper.
    autoInstall.enable = true;

    settings = {
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        rust = [ "rustfmt" ];
        python = [ "ruff_format" ];
        sh = [ "shfmt" ];
        json = [ "prettier" ];
        jsonc = [ "prettier" ];
        yaml = [ "prettier" ];
        toml = [ "prettier" ];
        markdown = [ "prettier" ];
        css = [ "prettier" ];
        html = [ "prettier" ];
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        typescriptreact = [ "prettier" ];
      };

      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action.__raw = ''
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end
      '';
      options.desc = "Format buffer";
    }
  ];
}
