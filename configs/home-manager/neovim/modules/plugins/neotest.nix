# Test runner
{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.neotest = {
      enable = true;
      adapters = {
        plenary.enable = true;
        python.enable = true;
        rust.enable = true;
        vitest.enable = true;
      };
    };

    # neotest-plenary does not declare plenary-nvim itself.
    extraPlugins = [ pkgs.vimPlugins.plenary-nvim ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>Tt";
        action.__raw = ''function() require("neotest").run.run() end'';
        options.desc = "Test nearest";
      }
      {
        mode = "n";
        key = "<leader>Tf";
        action.__raw = ''function() require("neotest").run.run(vim.fn.expand("%")) end'';
        options.desc = "Test file";
      }
      {
        mode = "n";
        key = "<leader>Ts";
        action.__raw = ''function() require("neotest").summary.toggle() end'';
        options.desc = "Test summary";
      }
      {
        mode = "n";
        key = "<leader>To";
        action.__raw = ''function() require("neotest").output_panel.toggle() end'';
        options.desc = "Test output";
      }
      {
        mode = "n";
        key = "<leader>Tl";
        action.__raw = ''function() require("neotest").run.run_last() end'';
        options.desc = "Test last";
      }
    ];
  };
}
