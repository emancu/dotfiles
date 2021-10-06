" Set encodings to UTF8
scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

" Basic settings
silent! set regexpengine=1
syntax on
filetype on
filetype indent on
filetype plugin on
set wrap

" Change default mapleader to a comma
let mapleader = ","
let maplocalleader = ","

" Try something to colorize vim and save time
" http://www.eecs.harvard.edu/~cduan/technical/vi/vi-4.shtml
"syn sync fromstart
syn sync minlines=60


" Folds
set fillchars="vert:YXXY,fold:-"

" Set spellcheck to English. z= to suggestions
"set spell
set spelllang=en_us
set spellsuggest=5

" Tabs management
set expandtab
autocmd FileType make setlocal noexpandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set textwidth=0
set showtabline=2
set laststatus=2

set statusline=
set statusline+=%<              " truncate
set statusline+=\ %f%m%r%h%w    " relative path
set statusline+=%=              " seperate between right- and left-aligned
set statusline+=%([%l,%v]%)     " line and column
set statusline+=%(\ %Y\ %)      " file type

" Font
set guifont=Menlo:h11


" Cursor line
set cursorline
" set cursorcolumn

" Highlights
hi TabLine cterm=bold ctermfg=Black ctermbg=DarkGray
hi TabLineFill cterm=bold ctermfg=Black ctermbg=DarkGray
hi TabLineSel cterm=NONE ctermfg=White ctermbg=DarkRed
hi StatusLine guifg=Black guibg=#E0D8AA ctermfg=Black ctermbg=LightYellow
hi StatusLineNC ctermfg=DarkGray ctermbg=Black
hi CursorLine cterm=NONE  ctermbg=23
hi MatchParen ctermbg=Black ctermfg=DarkYellow
hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Temp files
set nobackup
set nowritebackup
set noswapfile

" Show tabs and trailing spaces toggle with F11, remove with S-F11
set listchars=tab:⏤⇢,trail:⇢
set list
set complete=.,w,b,u

" Change file expansion to mimic shell behavior
set wildmenu
set wildmode=list:longest

set wildignore=*.png,*.jpg,*.gif,coverage/**,tmp/**,log/**,./voxeo_utils/**,./bin/**,docs/**,*.o,vendor/**

" Case insensitive, incremental search, manual folds, etc.
set nocompatible
set autoindent
set smartindent
set iminsert=0
set gdefault
set ignorecase
set smartcase
set foldmethod=manual
set number
set incsearch
set hlsearch

set noballooneval " Disable tooltip
set balloondelay=20000

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set termguicolors

" Colours
"colorscheme jellybeans
colorscheme one
set background=dark

" Backspace behavior
set backspace=indent,eol,start

" Other files.
source $DOTFILES_PATH/vim/config/mappings.vim
source $DOTFILES_PATH/vim/config/ctrlp.vim
source $DOTFILES_PATH/vim/config/to-github.vim
source $DOTFILES_PATH/vim/config/git-gutter.vim
source $DOTFILES_PATH/vim/config/tagbar.vim
source $DOTFILES_PATH/vim/abbreviations.vim
