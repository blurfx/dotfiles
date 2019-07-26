call plug#begin('~/.vim/plugged')


Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

colorscheme seoul256

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

nmap <F2> <C-o>
nmap <C-o> :NERDTreeToggle<CR>
nmap <Space> <PageDown>
