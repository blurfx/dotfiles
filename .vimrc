call plug#begin('~/.vim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/vim-easy-align'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/goyo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'leafgarland/typescript-vim'


call plug#end()

colorscheme PaperColor

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 15

set background=dark
set expandtab ts=2 sts=2 sw=2 ai
set number
set laststatus=2
set autoindent
set cindent
set backspace=2
set lazyredraw
set cul
set ttyfast
set mouse=nicr
set hlsearch
set showmatch

if $TERM == "xterm-256color"
  set t_Co=256
endif

syntax on

filetype plugin indent on
autocmd filetype python set ts=4 sts=4 sw=4 expandtab
autocmd BufNewFile *.cc,*.cpp 0r ~/.vim/skel/c++.cc

map <F2> :Le<CR>
