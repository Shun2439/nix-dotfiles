const base_path = '<sfile>'->expand()->fnamemodify(':h')

execute 'so' base_path .. '/.vim/base.vim'
execute 'so' base_path .. '/.vim/plugins.vim'
execute 'so' base_path .. '/.vim/keymaps.vim'

au FileType toml call dein#toml#syntax()

