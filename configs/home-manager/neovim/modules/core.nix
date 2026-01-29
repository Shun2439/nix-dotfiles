# Core Neovim settings
{ ... }:
{
  programs.nixvim.opts = {
    # Line numbers
    number = true;
    relativenumber = true;
    
    # Indentation
    tabstop = 2;
    shiftwidth = 2;
    expandtab = true;
    smartindent = true;
    
    # Search
    ignorecase = true;
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
    clipboard = "unnamedplus";
    splitbelow = true;
    splitright = true;
    
    # Timeout
    timeoutlen = 500;
    updatetime = 300;
    
    # Completion
    completeopt = "menu,menuone,noselect";
  };
}