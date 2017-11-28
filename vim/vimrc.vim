"//////////////
"// Must Haves

set nocompatible

"///////////
"// Plugins

" https://vimawesome.com/

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/vim/vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline.git'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'kien/ctrlp.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ethician/tabline.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"////////////////////
"// General Settings

syntax on
set t_Co=256
colorscheme wombat256eth
let mapleader=","

set modelines=0
set nocompatible
set backspace=2
set number
set colorcolumn=80
set cursorline
set showmode
set nowrap
set textwidth=0
set tabstop=2
set expandtab
set shiftwidth=2
set shiftround
set autoindent
set smartindent
set showmatch
set ignorecase
set smartcase
set scrolloff=2
set hlsearch
set incsearch
set listchars=eol:¶,tab:›–,trail:~,extends:»,precedes:«,nbsp:·
"set list
set nolist
set history=1000
set undolevels=1000
set title
set nobackup
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set comments=sl:/*,mb:\ *,elx:\ */
set laststatus=2
set wildmode=longest,list
set wildmenu
set pastetoggle=<F2>

"////////////////////////////
"// Plugin Specific Settings

" NERDCommenter
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" VimAirline
let g:airline_theme='wombat'

"///////////////
"// Status Line

"set statusline=
"set statusline +=%1*\ %n\ %*            "buffer number
"set statusline +=%5*%{&ff}%*            "file format
"set statusline +=%3*%y%*                "file type
"set statusline +=%4*\ %<%f%*            "full path
"set statusline +=%2*%m%*                "modified flag
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%l%*               "total lines
"set statusline +=%1*%4v\ %*             "virtual column number
"set statusline +=%2*0x%04b\ %*          "character under cursor
"hi user1 ctermfg=166
"hi user2 ctermfg=1
"hi user3 ctermfg=163
"hi user4 ctermfg=34
"hi user5 ctermfg=184

"/////////////////////////////////
"// tmux control keys propagation
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

"////////////
"// Mappings

nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>i
nmap <C-x> :q<CR>
imap <C-x> <ESC>:q<CR>i

" clang-format
map <leader>ff :pyf ~/.dotfiles/clang-format/clang-format.py<CR>
imap <leader>ff <ESC>:pyf ~/.dotfiles/clang-format/clang-format.py<CR>i

" NERDTree
map <C-o> :NERDTreeToggle<CR>
