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

source ~/.vim/mappings/window-navigation
source ~/.vim/mappings/rspec
source ~/.vim/mappings/tab-complete

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_max_files = 10000
let g:ctrlp_max_depth = 40
