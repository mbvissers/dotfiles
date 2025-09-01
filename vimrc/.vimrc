" Minimal vimrc

" Leader key
let mapleader=" "

" Line numbers
set number
set relativenumber

" Indentation / tabs
set tabstop=4       " number of spaces a <Tab> counts for
set shiftwidth=4    " spaces for each step of autoindent
set expandtab       " convert tabs to spaces
set smartindent     " smart autoindenting on new lines

" Searching
set ignorecase      " case-insensitive search...
set smartcase       " ... unless capital letters are used
set incsearch       " show matches as you type
set hlsearch        " highlight search matches

" Quality of life
set clipboard=unnamedplus " use system clipboard
set scrolloff=2         " keep some context when scrolling

" Keep things simple
syntax on
filetype plugin indent on

