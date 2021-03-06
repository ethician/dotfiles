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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ethician/tabline.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nightsense/stellarized'
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dense-analysis/ale'
Plugin 'vimwiki/vimwiki'
Plugin 'vifm/vifm.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

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
"set termguicolors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if strftime('%H') >= 6 && strftime('%H') < 22
  set background=light
else
  set background=dark
endif
let g:gruvbox_contrast_light = 'soft'
let g:gruvbox_contrast_dark = 'soft'
colorscheme gruvbox
let mapleader=","

set modelines=0
set nocompatible
set backspace=2
set number
set colorcolumn=80
set cursorline
"set guicursor=n-v-c-i:block,o:hor50,ci:ver50,r-cr:hor30,sm:block
set guicursor=
set showmode
set nowrap
set textwidth=0
let g:leave_my_textwidth_alone=1
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
"set signcolumn=yes

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

"nmap <C-s> :w<CR>
"imap <C-s> <ESC>:w<CR>i
"nmap <C-x> :q<CR>
"imap <C-x> <ESC>:q<CR>i

" clipboard
"set clipboard+=unnamedplus
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" tabs
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
inoremap <A-Left> <ESC>:tabprevious<CR>
inoremap <A-Right> <ESC>:tabnext<CR>

" screen movement
nnoremap <A-Up> <C-y>
nnoremap <A-Down> <C-e>
inoremap <A-Up> <ESC><C-y>i
inoremap <A-Down> <ESC><C-e>i

" clang-format
map <leader>ff :py3f ~/.dotfiles/clang-format/clang-format.py<CR>
imap <leader>ff <ESC>:py3f ~/.dotfiles/clang-format/clang-format.py<CR>i

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/vim/ycm/ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_always_populate_location_list = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
set completeopt-=preview

let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

" sign column
map <leader>sy :set signcolumn=yes<CR>
imap <leader>sy <ESC>:set signcolumn=yes<CR>i
map <leader>sn :set signcolumn=no<CR>
imap <leader>sn <ESC>:set signcolumn=no<CR>i

" background
map <leader>bd :set background=dark<CR>
imap <leader>bd <ESC>:set background=dark<CR>i
map <leader>bl :set background=light<CR>
imap <leader>bl <ESC>:set background=light<CR>i

" location list
map <leader>lp :lp<CR>
imap <leader>lp <ESC>:lp<CR>i
map <leader>ln :lne<CR>
imap <leader>ln <ESC>:lne<CR>i

" NERDTree
map <C-o> :NERDTreeToggle<CR>

" ALE
map <leader>ll :ALELint<CR>
map <leader>li :ALEInfo<CR>
"let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = 'ee'
let g:ale_sign_warning = 'ww'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_linters = {'cpp': ['clangtidy']}
"let g:ale_linters = {'cpp': ['clangcheck', 'clangtidy', 'cppcheck', 'flawfinder']}
"let g:ale_cpp_clangtidy_checks = ['-*' , 'abseil-*', 'boost-*', 'cert-*', 'cppcoreguidelines-*', '-cppcoreguidelines-pro-bounds-array-to-pointer-decay', 'clang-analyzer-*' , 'google-*', '-google-readability-braces-around-statements', 'hicpp-*', '-hicpp-no-array-decay', '-hicpp-braces-around-statements', 'performance-*']

" vimfm
map <leader>vv :Vifm<CR>
map <leader>vs :VsplitVifm<CR>
map <leader>vS :SplitVifm<CR>
map <leader>vd :DiffVifm<CR>
map <leader>vt :TabVifm<CR>

" fzf
map <leader>oo :FZF<CR>
map <leader>og :Rg<CR>

" automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
highlight ExtraWhitespace ctermbg=red guibg=red
