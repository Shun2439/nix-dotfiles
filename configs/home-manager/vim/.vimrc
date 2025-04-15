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

" emmet-vim ----- {{{
let g:user_emmet_leader_key='<c-t>'
" }}}

" ddc ----- {{{
" ui で何を使用するか指定
call ddc#custom#patch_global('ui', 'native')

" 補完内容を管理
call ddc#custom#patch_global('sources', [
    \ 'around',
    \ 'file',
    \ 'vim-lsp',
    \ ])

" 保管時のオプションを管理
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank']
    \ },
    \ 'around': {
    \     'mark': 'A'
    \ },
    \ 'file': {
    \     'mark': 'F',
    \     'isVolatile': v:true,
    \     'forceCompletionPattern': '\S/\S*',
    \ },
    \ 'lsp': {
    \     'mark': 'lsp',
    \     'isVolatile': v:true,
    \     'forceCompletionPattern': '\.\w*|:\w*|->\w*',
    \ },
    \ })


call ddc#custom#patch_global('sourceParams', #{
      \   lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \   }
      \ })

" call ddc#custom#patch_filetype(
"     \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
"     \ 'sourceOptions': {
"     \   'file': {
"     \     'forceCompletionPattern': '\S\/\S*',
"     \   },
"     \ },
"     \ 'sourceParams': {
"     \   'file': {
"     \     'mode': 'unix',
"     \   },
"     \ }})

" ddc を有効化！
call ddc#enable()

" }}}

