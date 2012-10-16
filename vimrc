set nocompatible                            " not compatible with vi


filetype off                                " disable system ftdetect files
call pathogen#runtime_append_all_bundles()  " initialize Pathogen
syntax on                                   " enable syntax highlighting
filetype plugin indent on                   " enable file type detection


set tabstop=2 " Number of spaces inserted for a tab
set shiftwidth=2 " Number of spaces to use when indenting
set expandtab " Insert spaces whenever tab key is pressed
set autoindent " Auto indent next line
set ruler " Show line number and column
" set incsearch " Incremental search (highlight and move to first match while typing)
set hlsearch
set bs=2
set wildmode=longest,list
set splitbelow
set splitright
set wildignore=.git,*swp,*.log,sharedfs/*
let g:CommandTMaxFiles=50000


set background=dark
colorscheme railscasts
"colo darkblue " Backup color scheme if 256 colors aren't available


" rspec mappings
"map ,t :w\|!spec %<CR>
map ,t :call RunSpecFile()<CR>
map ,s :call RunNearestSpec()<CR>
map ,l :call RunLastSpec()<CR>

" spec support
function! GuessSpecCommand()
  if executable("rspec")
    return "rspec"
  else
    return "spec"
  endif
endfunction

function! RunSpecFile()
  if InSpecFile()
    let t:last_spec_file_command = GuessSpecCommand() . " " . @% . " -cfn"
  endif

  call RunLastSpecFile()
endfunction

function! RunNearestSpec()
  if InSpecFile()
    let t:last_nearest_spec_command = GuessSpecCommand() . " " . @% . " -cfn -l " . line(".")
  endif

  call RunLastNearestSpec()
endfunction

function! RunLastSpec()
  call RunSpecs()
endfunction

function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1
endfunction

function! RunLastNearestSpec()
  if exists("t:last_nearest_spec_command")
    call SetLastSpecCommand(t:last_nearest_spec_command)
    call RunSpecs()
  endif
endfunction

function! RunLastSpecFile()
  if exists("t:last_spec_file_command")
    call SetLastSpecCommand(t:last_spec_file_command)
    call RunSpecs()
  endif
endfunction

function! RunSpecs()
  if exists("t:last_spec_command")
    execute ":w\|!clear && echo " . t:last_spec_command . " && echo && " . t:last_spec_command
  endif
endfunction

function! SetLastSpecCommand(command)
  let t:last_spec_command = a:command
endfunction


" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
