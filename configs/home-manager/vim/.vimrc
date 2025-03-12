" normal
" バッファの切替 ----- {{{
nnoremap <silent> <c-j> :bprev<CR>
nnoremap <silent> <c-k> :bnext<CR>
" }}}

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

" https://zenn.dev/vim_jp/articles/67ec77641af3f2 ----- {{{
nmap zz zz<sid>(z1)
nnoremap <script> <sid>(z1)z zt<sid>(z2)
nnoremap <script> <sid>(z2)z zb<sid>(z3)
nnoremap <script> <sid>(z3)z zz<sid>(z1)
" }}}

" WINDOW (NOT WINDOWS) ----- {{{
" nnoremap <c-j> <c-w>j
" nnoremap <c-k> <c-w>k
" nnoremap <c-h> <c-w>h
" nnoremap <c-l> <c-w>l

noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
" }}}

" color ----- {{{
colorscheme nord
hi CocInlayHint ctermfg=green ctermbg=242 guifg=#15aabf guibg=Grey
" }}}

" denops ----- {{{
" let g:denops#deno = '~/.nix-profile/bin/deno'
let g:denops#deno = '/home/shun2439/.nix-profile/bin/deno'
" }}}

