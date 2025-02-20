" const base_path = '<sfile>'->expand()->fnamemodify(':h')

so '~/.vim/base.vim'
so '~/.vim/plugins.vim'
so '~/.vim/keymaps.vim'

au FileType toml call dein#toml#syntax()

