" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

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

" Syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'neovimhaskell/haskell-vim'
NeoBundle 'raichoo/purescript-vim'
NeoBundle 'alx741/vim-hindent'
NeoBundle 'vim-scripts/rfc-syntax'
NeoBundle 'LnL7/vim-nix'

" Style
NeoBundle 'nbouscal/vim-stylish-haskell'

" Nerds
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'godlygeek/tabular'

" Autocomplection
NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'eagletmt/ghcmod-vim'
"NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'frigoeu/psc-ide-vim'

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

" Syntactic
map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" GHC-mod
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

" NerdTree
map <Leader>n :NERDTreeToggle<CR>

" Tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" Haskell vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_classic_highlighting = 0
let g:haskell_indent_guard = 2
let g:haskell_indent_in = 1
let g:haskell_indent_do = 3
let g:haskell_indent_where = 6
let g:haskell_indent_let = 4
let g:haskell_indent_case = 2
let g:haskell_indent_if = 3

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
