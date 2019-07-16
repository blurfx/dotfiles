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

syntax on
set autoindent
set background=dark
set backspace=2
set backspace=indent,eol,start
set cindent
set cul
set display+=lastline
set encoding=utf-8
set formatoptions+=o
set gdefault
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set mouse=nicr
set nojoinspaces
set number
set ruler
set showmatch
set showmode
set smartcase
set splitright
set tabstop=4 shiftwidth=4 expandtab
set ttyfast
highlight CursorLine cterm=underline gui=underline

if $TERM == "xterm-256color"
  set t_Co=256
endif

filetype plugin indent on

map <F2> :Le<CR>
nmap <Space> <PageDown>
