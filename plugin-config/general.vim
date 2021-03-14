
" general config
syntax on
filetype on
filetype plugin indent on
set nocompatible
highlight Normal ctermbg=NONE
set clipboard=unnamedplus
set number relativenumber
set cursorline
set autoread
set autowrite
set autoindent
set si "smart indent
set nobackup
set nowb
set noswapfile
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,mac
if has('mouse')
    set mouse=a
endif
set encoding=utf8
set guifont="FiraCode Nerd Font:h13"
set errorformat=%f:%l:\ %m
set ttyfast
set lazyredraw
set showmode
set showcmd
set title
set hidden
set splitbelow
set splitright
" Keep lots of history/undo
set undolevels=1000
" File ignore Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Better display for messages
set cmdheight=1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set foldmethod=indent
set foldnestmax=10
set foldlevel=99
set lazyredraw
set showmatch
"set concealcursor=nciv
set conceallevel=2
" enable 256 colors
set t_Co=256
set t_ut=
" always show the status bar
set laststatus=2
" sane editing
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
" highlight matching brakets
hi MatchParen cterm=bold ctermbg=none ctermfg=lightblue term=none
set hlsearch
set incsearch
set ruler
set nowrap
set termguicolors
if finddir('.venv', '.;')
    let g:python3_host_prog = './.venv/bin/python'
endif
let g:python3_host_prog = '/usr/local/bin/python'
