set nocompatible

" Enable NeoBundle
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Airline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Snippets
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Autocomplection
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'eagletmt/neco-ghc'

" Plugins end
call neobundle#end()

" Enable syntax highlight
filetype indent plugin on | syn on

" Configuration
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1

let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1

set showtabline=2
set laststatus=2
set noshowmode

" Color scheme
colorscheme wombat256mod
highlight LineNr ctermfg=Yellow
set cursorline
set number

" Tab setup
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set nojoinspaces
set expandtab
" Show match [] {}
set showmatch

" Mark the 79th column.
set colorcolumn=+1
highlight ColorColumn guibg=#2d2d2d ctermbg=235

" Mark tabs, trailing spaces on a line, lambdas with trailing spaces and
" various missing spaces.
highlight WarnWhitespace ctermbg=red guibg=red
autocmd FileType haskell match WarnWhitespace /\t\|\s\+$\|\\\s\+\|,\S\|--|\|\S\s--/

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
