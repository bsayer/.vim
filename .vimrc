set nocompatible
execute pathogen#infect()
call pathogen#helptags()

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

set background=light
colorscheme solarized

" Vim-Airline Settings
let g:airline_powerline_fonts = 1
set laststatus=2

" Load CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_map = 'π'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.git,*.so,*.swp,*.zip

set number
set cursorline

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set colorcolumn=80,120
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" tab settings
set tabstop=3
set softtabstop=3
set sw=3
set shiftround

if has('mouse')
  set mouse=a
endif

:nnoremap <F12> :buffers<CR>:buffer<Space>

" phpqa settings
"
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0

" Show code coverage on load (default = 0)
let g:phpqa_codecoverage_autorun = 0

" Open the location list automatically (default = 1)
let g:phpqa_open_loc = 1

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  au BufRead,BufNewFile *.mh set filetype=php

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
