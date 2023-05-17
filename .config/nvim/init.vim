cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q


let g:config_dir = expand('~/.config/nvim/config/')
let s:file_plug_candidate = []

command! -nargs=1 PlugConfig call <SID>plug_config(<args>)
function! s:plug_config( ... )
    call add(s:file_plug_candidate, g:config_dir . a:1)
endfunction


call plug#begin()

" UI
    Plug 'bling/vim-airline'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'blurfx/auto-indent.vim'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'bluz71/vim-moonfly-colors'
        PlugConfig 'moonfly.vim'
    

" 언어 확장
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        PlugConfig 'coc.vim'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 파일 탐색
    Plug 'junegunn/fzf.vim'

" 생산성
    Plug 'wakatime/vim-wakatime'


call plug#end()

" Load Plug Config
for include_file in s:file_plug_candidate
    execute "source " . include_file
endfor
let s:file_plug_candidate = v:null

" 테마 설정
colorscheme moonfly

" Vim Built-in 설정
syntax on
filetype plugin indent on
highlight CursorLine cterm=bold gui=bold

set autoindent
set background=dark
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
set number
set ruler
set showmatch
set showmode
set smartcase
set smarttab
set splitright
set tabstop=4 shiftwidth=4 expandtab
set ttyfast
set hidden
set termguicolors
set incsearch
set autoread
set wildmenu
set wildmode=full
set wildignorecase
set backupdir=/tmp//,.
set directory=/tmp//,.


    " vim bulit-in filetree 설정
    let g:netrw_liststyle = 3
    let g:netrw_banner = 0
    let g:netrw_browse_split = 0
    let g:netrw_altv = 1
    let g:netrw_winsize = 15


" vim 키매핑
nmap <Space> <PageDown>
nmap <M-Space> <PageUp>
