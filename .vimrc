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
Plug 'leafgarland/typescript-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'blurfx/auto-indent.vim'
Plug 'akinsho/toggleterm.nvim'
Plug 'rescript-lang/vim-rescript'

 
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
set wildmenu
set wildmode=full
set backupdir=/tmp//,.
set directory=/tmp//,.


highlight CursorLine cterm=bold gui=bold
highlight IndentGuidesOdd  ctermbg=lightgrey

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

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
nnoremap Q @q

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W


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

" auto-indent
let g:autoindent_indent_size = 2
let g:autoindent_expandtab = 0

" ToggleTerm
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-e> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent><c-e> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-e> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <F1> <C-\><C-n><C-w>w

" taken from https://github.com/johngrib/dotfiles
" Easy motion
let g:EasyMotion_do_mapping  = 0 " Disable default mappings
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

" 화면에 힌트키가 대문자로 표시되게 한다.
" (YB 는 삭제해뒀음)
let g:EasyMotion_keys = ' ASDFQWERZXCV1234GHNTU[]567890-=,/.;IOPMLJK'
let g:EasyMotion_use_upper = 1

nmap <c-s> [easymotion-p]
vmap <c-s> [easymotion-p]

nmap [easymotion-p]<c-s> <Plug>(easymotion-overwin-line)

" INSERT 모드에서 입력하면 해당 라인 내에서 좌우로 이동 가능
imap <c-s> <c-o><Plug>(easymotion-lineanywhere)

nmap [easymotion-p]2 <Plug>(easymotion-overwin-f2)

" easymotion + hjkl
nmap [easymotion-p]l <Plug>(easymotion-lineforward)
vmap [easymotion-p]l <Plug>(easymotion-lineforward)
nmap [easymotion-p]j <Plug>(easymotion-j)
vmap [easymotion-p]j <Plug>(easymotion-j)
nmap [easymotion-p]k <Plug>(easymotion-k)
vmap [easymotion-p]k <Plug>(easymotion-k)
nmap [easymotion-p]h <Plug>(easymotion-linebackward)
vmap [easymotion-p]h <Plug>(easymotion-linebackward)

nmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
vmap [easymotion-p]a <Plug>(easymotion-jumptoanywhere)
nmap [easymotion-p]w <Plug>(easymotion-overwin-w)
nmap [easymotion-p]f <Plug>(easymotion-overwin-f)
nmap [easymotion-p]/ <Plug>(easymotion-sn)

" Smartsign (`3`을 입력하면 `3`과 `#`에 매치됨)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" vim-choosewin 설정

nmap [easymotion-p]<Space> <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_label = 'JKLIOPM'

