"install dein
let $CACHE = expand('~/.cache')

".cacheがなかったら作成する
if !($CACHE->isdirectory())
	call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
	let s:dir = 'dein.vim'->fnamemodify(':p')
	if !(s:dir->isdirectory())
		let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
		if !(s:dir->isdirectory())
			execute '!git clone https://github.com/Shougo/dein.vim' s:dir
		endif
	endif
	execute 'set runtimepath^='
				\ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif

"road plugins
call dein#begin($CACHE .. '/dein')

call dein#add(s:dir)

let $DEIN_TOML='~/.vim/toml/dein.toml'

let $DEIN_LAZY_TOML='~/.vim/toml/dein_lazy.toml'

call dein#load_toml($DEIN_TOML, {'lazy' : 0})

call dein#load_toml($DEIN_LAZY_TOML, {'lazy' : 1})

"let g:dein#auto_recache = v:true

call dein#end()

call dein#save_state()

"call dein#recache_runtimepath()

if dein#check_install()
	call dein#install()
endif

au FileType toml call dein#toml#syntax()

