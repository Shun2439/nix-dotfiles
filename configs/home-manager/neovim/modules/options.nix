# Core Neovim settings
{ ... }:
{
  programs.nixvim.opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Indentation
    expandtab = true;
    shiftround = true;
    shiftwidth = 2;
    softtabstop = 2;
    tabstop = 2;
    smartindent = true;

    # Search
    # ignorecaoe = true;
    smartcase = true;
    hlsearch = false;
    incsearch = true;

    # Display
    wrap = false;
    cursorline = true;
    termguicolors = true;
    signcolumn = "yes";

    # Behavior
    hidden = true;
    mouse = "a";
    clipboard = "unnamedplus,unnamed";
    splitbelow = true;
    splitright = true;
    scrolloff = 3;
    whichwrap = "b,s,h,l,<,>,[,],~";

    # Timeout
    timeoutlen = 500;
    updatetime = 300;

    # Completion
    completeopt = "menu,menuone,noselect";
  };
}
