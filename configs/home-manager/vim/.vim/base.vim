"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileencodings=utf-8,cp932

" TAB AND INDENT ----------------------------------------- {{{
set expandtab
set smartindent

let g:isVisualStudioProject = 0

let g:normalEdit = 1

if normalEdit
	set shiftwidth=4
	set tabstop=4
endif

if isVisualStudioProject
	set shiftwidth=2
	set tabstop=2
endif

" }}}

" APPEARANCE ------------------- {{{
set nu

set background=dark

filetype plugin indent on

syntax on

" }}}

" SEARCH -------- {{{
set incsearch
set ignorecase

set showcmd

set showmatch

set hlsearch

" }}}

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" PYTHON -------------------------------------- {{{
au BufNewFile,BufRead *.py
			\ set tabstop=4
			\ set softtabstop=4
			\ set shiftwidth=4
			\ set textwidth=79
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix
" }}}

" HTML --------------------------------------------------------- {{{
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
" }}}


" https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/

