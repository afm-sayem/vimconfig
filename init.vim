set nocompatible

call plug#begin('~/.config/nvim/plugged')

Plug 'IN3D/vim-raml'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/vimproc.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'einars/js-beautify'
Plug 'flazz/vim-colorschemes'
Plug 'gcorne/vim-sass-lint'
Plug 'heavenshell/vim-jsdoc'
Plug 'honza/vim-snippets'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'neomake/neomake'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" ########################
" Look and feel
" ########################

set background=dark
colorscheme Tomorrow-Night-Eighties

set expandtab
set smarttab
set ai "Auto Indent
set si "Smart Indent
set wrap "Wrap lines
set hidden

set shiftwidth=2
set tabstop=2

set hlsearch
set ignorecase
set nobackup
set showmatch
set smartcase
set number

set laststatus=2
"disable mouse
set mouse=

" no need to save backup or swap file
set nobackup
set noswapfile

set colorcolumn=+1        " highlight column after 'textwidth'
set colorcolumn=100

" automaticalli reload file changed outside of editor
set autoread

" share clipboard with system
set clipboard+=unnamedplus
" set up column guide
" highlight colorcolumn ctermbg=3
" set colorcolumn=80


" no visual bell
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" ########################
" Mappings
" ########################

" change the mapleader from \ to space
let mapleader="\<Space>"

" leader remaps
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>n <C-^>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>e :Lexplore<CR>

"surround with quotes
nnoremap <Leader>q ciw''<Esc>P

" Easier command mode
nnoremap ; :


" ########################
" Plugins
" ########################

" CtrlP
" ------------------------
let g:ctrlp_use_caching = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" A better search for ctrlp
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif

" netRW
" ------------------------
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Airline
" ------------------------
let g:airline#extensions#tabline#enabled = 1 "show tabs

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

if executable('flow')
  let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
else
  let g:neomake_javascript_enabled_makers = ['eslint']
endif

" Static code analysis
autocmd! BufWritePost * Neomake
autocmd CompleteDone * pclose

