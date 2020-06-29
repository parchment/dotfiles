set autoread                                     " reload on external file changes

set backspace=indent,eol,start                   " backspace behaviour
set clipboard=unnamed,unnamedplus                " enable clipboard
set encoding=utf8                                " enable utf8 support
set hidden                                       " hide buffers, don't close
set mouse=a                                      " enable mouse support
set wrap
set textwidth=80
set number                                       " show line numbers
set term=xterm-256color                          " terminal type
set wildmenu wildmode=longest:full,full          " wildmode settings

" User Interface
filetype plugin indent on                        " enable filetype detection
set listchars=eol:¶,trail:•,tab:▸\               " whitespace characters
set scrolloff=999                                " center cursor position vertically
set showbreak=¬\                                 " Wrapping character
set showmatch                                    " show matching brackets
syntax on                                        " enable syntax highlightning
syntax enable
set hlsearch ignorecase incsearch smartcase      " search options

" Tabs and Identation
set autoindent expandtab                         " autoindentation & tabbing
set shiftwidth=2 softtabstop=2 tabstop=2         " 1 tab = 2 spaces

" Undo and Backup
set nobackup noswapfile nowritebackup            " disable backup/swap files
set undofile undodir=~/.vim/undo undolevels=9999 " undo options

" Performance
set lazyredraw                                   " enable lazyredraw
set nocursorline                                 " disable cursorline
set ttyfast                                      " enable fast terminal connection
