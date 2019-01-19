" dein script 
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " plugins
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('scrooloose/nerdtree')
  call dein#add('fatih/vim-go')
  call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Raimondi/delimitMate')

  call dein#end()
  call dein#save_state()
endif

" check for new plugins
if dein#check_install()
  call dein#install()
endif

" key maps
map <C-A> :NERDTreeToggle <CR>
map <C-s> :w! <CR>
map <C-q> :q! <CR>
map <C-x> :wq! <CR>

" vim settings
colorscheme zenmint
syntax enable
filetype plugin indent on
set title
set noswapfile
set hlsearch
set incsearch
set number
set termguicolors

" go settings
let g:go_fold_enable = ['import']
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_space_tab_error = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_highlight_types = 1
let g:go_highlight_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" nerdtree settings
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

" airline
let g:airline_theme='monochrome'
let g:airline_powerline_fonts=1
