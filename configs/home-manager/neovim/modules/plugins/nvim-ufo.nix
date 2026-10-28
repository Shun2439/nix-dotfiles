# Folding powered by LSP / tree-sitter
{ ... }:
{
  programs.nixvim.plugins.nvim-ufo = {
    enable = true;
    settings = {
      open_fold_hl_timeout = 150;

      # nvim-ufo only accepts a `{ main, fallback }` pair here.
      provider_selector = {
        __raw = ''
          function(bufnr, filetype, buftype)
            local ok, clients = pcall(vim.lsp.get_clients, { bufnr = bufnr })
            if ok then
              for _, client in ipairs(clients) do
                local caps = client.server_capabilities or {}
                if caps.foldingRangeProvider then
                  return { "lsp", "indent" }
                end
              end
            end
            return { "treesitter", "indent" }
          end
        '';
      };

      close_fold_kinds_for_ft = {
        default = [
          "imports"
          "comment"
        ];
        json = [ "array" ];
        jsonc = [ "array" ];
      };

      fold_virt_text_handler = {
        __raw = ''
          function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = ("  %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
              local chunkText = chunk[1]
              local chunkWidth = vim.fn.strdisplaywidth(chunkText)
              if targetWidth > curWidth + chunkWidth then
                table.insert(newVirtText, chunk)
              else
                chunkText = truncate(chunkText, targetWidth - curWidth)
                local hlGroup = chunk[2]
                table.insert(newVirtText, { chunkText, hlGroup })
                chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if curWidth + chunkWidth < targetWidth then
                  suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                end
                break
              end
              curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
          end
        '';
      };
    };
  };

  # `foldcolumn` is intentionally left alone: snacks.statuscolumn draws the
  # fold indicators itself.
  programs.nixvim.opts = {
    foldenable = true;
    foldlevel = 99;
    foldlevelstart = 99;
  };
}
