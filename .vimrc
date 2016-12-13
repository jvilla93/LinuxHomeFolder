set nocompatible    " turn off Vi compatibility



""" Vundle stuff """

filetype off

" include and start Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/nerdtree'

" color schemes
Plugin 'michalbachowski/vim-wombat256mod'

call vundle#end()
filetype plugin indent on



""" keymaps """

let mapleader = " "

noremap <Leader>n :NERDTreeToggle <CR>
noremap <Leader>f :CtrlP <CR>
noremap <Leader>b :CtrlPBuffer <CR>

" toggle relative or non-relative line numbers
function! LineNumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
noremap <Leader>l :call LineNumberToggle() <CR>

" resize splits
nnoremap <C-up> :resize +2 <CR>
nnoremap <C-down> :resize -2 <CR>
nnoremap <C-right> :vertical resize +2 <CR>
nnoremap <C-left> :vertical resize -2 <CR>

" inverse tab
inoremap <S-tab> <C-d>


""" non-basic settings """

" NERDTree settings
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1

" flag trailing whitespace in programming language files
autocmd ColorScheme * highlight TrailingWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h match TrailingWhitespace /\s\+$/



""" basic VIM settings """

" use UTF-8 encoding
set encoding=utf-8

" choose a color scheme
if $TERM == "xterm-256color" || $TERM == "screen-256color"
    " if we're in a 256 color terminal, use this color scheme
    :colorscheme wombat256mod
elseif filereadable("$VIMRUNTIME/colors/industry.vim")
    " choose this colorscheme if we don't have 256 colors (and if it's built-in
    "   to the VIM installation)
    :colorscheme industry
endif
syntax on

" disable cursor blinking
set guicursor+=a:blinkon0

" highlight searches
set hlsearch

" use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" allow backspacing over autoindent, line breaks, start of insert action
set backspace=indent,eol,start

" turn on autoindent
set autoindent

" always display status line, even if only one window is displayed
set laststatus=2
" status line format
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" use visual bell instead of beeping when doing something wrong
set visualbell
" then turn off visual bell
set t_vb=
" t_vb gets reset when the GUI opens...tell it to turn it back off
au GUIEnter * set t_vb=

" command window height = 2
set cmdheight=2

" use 4 spaces instead of tab
set shiftwidth=4
set softtabstop=4
set expandtab

" display line numbers
set number

" source site-specific vimrc file
if filereadable("~/.vimrc-site")
    source ~/.vimrc-site
endif
