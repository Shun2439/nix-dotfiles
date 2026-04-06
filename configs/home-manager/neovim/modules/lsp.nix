# LSP configuration
{ ... }:
{
  programs.nixvim.plugins = {
    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };
    fidget = {
      enable = true;
      settings = {
        notification = {
          window = {
            winblend = 0;
          };
        };
        progress = {
          display.done_style = "";
        };
      };
    };

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd.enable = true;
        dockerls.enable = true;
        hls = {
          enable = true;
          installGhc = false;
        };
        lua_ls.enable = true;
        # nixd.enable = true;
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
        ts_ls.enable = true;
      };

      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
          "<leader>e" = "open_float";
          "<leader>q" = "setloclist";
        };
        lspBuf = {
          "K" = "hover";
          "gD" = "references";
          "gd" = "definition";
          "gi" = "implementation";
          "gt" = "type_definition";
          # "<leader>ca" = "code_action";
          # "<leader>rn" = "rename";
          # "<leader>fm" = "format";
        };
      };
    };

    # LSP completion
    cmp = {
      enable = false;
      autoEnableSources = true;
      cmdline = {
        "/" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            { name = "buffer"; }
            # { name = "cmdline_history"; }
          ];
        };
        ":" = {
          mapping = {
            __raw = "cmp.mapping.preset.cmdline()";
          };
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option = {
                ignore_cmds = [
                  "Man"
                  "!"
                ];
              };
            }
          ];
        };
      };
      settings = {
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };
    };
    blink-cmp = {
      enable = true;
      settings = {
        appearance = {
          nerd_font_variant = "normal";
          use_nvim_cmp_as_default = true;
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution = {
                enabled = false;
              };
            };
          };
          documentation = {
            auto_show = true;
          };
          ghost_text.enabled = true;
        };
        signature = {
          enabled = true;
        };
        sources = {
          providers = {
            buffer = {
              score_offset = -7;
            };
            lsp = {
              fallbacks = [ ];
            };
          };
        };
      };
    };
  };
}
