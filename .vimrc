cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'leafgarland/typescript-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-eslint'
Plug 'NLKNguyen/papercolor-theme'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'wakatime/vim-wakatime'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'bluz71/vim-moonfly-colors'
Plug 'rust-lang/rust.vim'

call plug#end()

colorscheme moonfly

let g:impact_transbg=1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:moonflyUnderlineMatchParen = 1
let g:moonflyTransparent = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-rls',
\ ]
let NERDTreeShowHidden=1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"


syntax on
set autoindent
" set background=dark
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
set smarttab
set splitright
set tabstop=4 shiftwidth=4 expandtab
set ttyfast
set hidden
set termguicolors
set incsearch
set autoread

highlight CursorLine cterm=bold gui=bold
highlight IndentGuidesOdd  ctermbg=lightgrey

filetype plugin indent on

" indentation
autocmd FileType javascript,javascriptreact,typescript,typescriptreact,html,css setlocal tabstop=2 shiftwidth=2

" comment block
autocmd FileType c,cpp,java,scala,go,javascript,typescript let b:comment_block = '// '
autocmd FileType sh,python let b:comment_block = '# '
autocmd FileType vim let b:comment_block = '" '

nmap <F2> <C-o>
nmap <C-o> :NERDTreeToggle<CR>
nmap <Space> <PageDown>
nmap <M-Space> <PageUp>

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

noremap <silent> ,, :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_block,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,. :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_block,'\/')<CR>//e<CR>:nohlsearch<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

