set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set ruler
set hlsearch
set bs=2
set wildmode=longest,list
set splitbelow
set splitright
set complete-=i " don't look in included files when autocompleting

filetype off
call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme railscasts
"colo darkblue " Backup color scheme if 256 colors aren't available

" map \t to ctrlp
map <silent> <LocalLeader>t  :CtrlP<CR>

" switch windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

source ~/.vim/rspec
source ~/.vim/tab-complete
