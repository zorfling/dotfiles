set nocompatible               " be iMproved
filetype on
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'commentary.vim'
Bundle 'delimitMate.vim'
Bundle 'AutoTag'

" Languages and frameworks
Bundle 'php.vim-for-php5'
Bundle 'html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'beyondwords/vim-twig'
Bundle 'rodjek/vim-puppet'

syntax on
filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

map [ :bprev<CR>
map ] :bnext<CR>

map = :NERDTreeToggle<CR>
map - :hide<CR>

nmap <bar> :vsplit<cr>
nmap _ :split<cr>

nmap <Tab> <C-W>

" Disable visual bell (set bell to visual, then clear) (primarily for lxterminal).
" http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb=
if has('autocmd')
   autocmd GUIEnter * set visualbell t_vb=
endif

set tags=./.tags;/

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" My original stuff
let g:solarized_termcolors=256
if ! has("gui_running")
    set t_Co=256
endif
" feel free to choose :set background=light for a different style
set background=dark
if &diff
    colorscheme peaksea
else
    colorscheme solarized
endif

set diffopt+=iwhite

set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

map [ :bprev<CR>
map ] :bnext<CR>


