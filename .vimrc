" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

filetype plugin indent on
let g:pymode_python = 'python3'

" Don't yank on paste
vnoremap p "_dP

" Add ';' at EOL
function! AppendSemicolon()
	let save_pos = getpos(".")
	normal! A;
	call setpos(".", save_pos)
	normal! a
endfunction
" Map function to <Shift-k>
map K :call AppendSemicolon()<CR>

" Fix diacritical chars (æ, ø, å, etc.)
set encoding=utf-8

" Turn on syntax highlighting.
syntax enable
colorscheme monokai

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Enable relative line numbering.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" Alow Backspace before last insert
set backspace=indent,eol,start

" Make search case-insensitive when all characters in the string
" are lowercase, but case-sensitive if contains any capital letters.
set ignorecase
set smartcase

" Enable searching while typing
set incsearch

" Disable Ex mode
nmap Q <Nop>

" Disable bell
set noerrorbells visualbell t_vb=

" Set tab length
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Set vim to autoindent
set autoindent
"
" Set wrap at column, only in .md-files
au filetype markdown set textwidth=80

" Set ruler at column
set colorcolumn=80

