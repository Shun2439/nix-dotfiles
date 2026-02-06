# LSP configuration
{ ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    fidget = {
      enable = true;
      settings = {
        progress = {
          display.done_style = "✔ ";
          display.done_icon_overridden = false;
        };
        notification = {
          window = {
            winblend = 0;
          };
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd = {
          enable = true;
          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
            options = {
              nixos = {
                expr = "(builtins.getFlake \"/etc/nixos\").nixosConfigurations.kilimanjaro.options";
              };
              home-manager = {
                expr = "(builtins.getFlake \"/etc/nixos\").homeConfigurations.\"shun2439@kilimanjaro\".options";
              };
            };
          };
        };
        lua_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        ts_ls.enable = true;
        pyright.enable = true;
        nil_ls.enable = true;
      };

      keymaps = {
        lspBuf = {
          "gD" = "references";
          "gd" = "definition";
          "gi" = "implementation";
          "gt" = "type_definition";
          "K" = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
          "<leader>fm" = "format";
        };
        diagnostic = {
          "[d" = "goto_next";
          "]d" = "goto_prev";
          "<leader>e" = "open_float";
          "<leader>q" = "setloclist";
        };
      };
    };

    # LSP completion
    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-u>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
          "<Down>" = "cmp.mapping.select_next_item()";
          "<Up>" = "cmp.mapping.select_prev_item()";
        };
      };
    };
  };
}
