" Haakon's vimrc



" Plugins (vim-plug)
"
" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Install plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'itchyny/lightline.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'mg979/vim-visual-multi'
Plug 'machakann/vim-highlightedyank'
call plug#end()



" Main settings
"
" Disable Vi compatibility (thus enabling more Vim features)
set nocompatible
" Use system clipboard
set clipboard=unnamed
" Fix diacritical chars (�, �, �, etc.)
set encoding=utf-8
" Disable the default Vim startup message
set shortmess+=I
" Show line numbers (how is this not default on)
set number
" Use relative numbering style
set relativenumber
" Always show the status line at the bottom
set laststatus=2
" Always allow backspacing
set backspace=indent,eol,start
" Case insensitive search
set ignorecase
" Unless you start entering uppercase letters
set smartcase
" Search while typing search term
set incsearch
" Bell sound go __ (disable bell)
set noerrorbells visualbell t_vb=
" Sometimes you gotta click that mouse (enable mouse support)
set mouse+=a
" Set vim to autoindent
set autoindent
" Set ruler at column 80 and 100
set colorcolumn=80,100
" Set tab length
set tabstop=4
set softtabstop=4
set shiftwidth=4



" Other settings
"
" Set wrap at column, only in .md-files
au filetype markdown set textwidth=100
" Turn on syntax highlighting.
syntax enable
" Set color scheme
"colorscheme monokai
colorscheme codedark



" Keymaps
"
" Don't yank on paste
vmap p "_dP
" Ctrl+Shift+[k or j] moves current line up or down
nmap <c-s-k> :m -2<CR>
nmap <c-s-j> :m +1<CR>
" Disable ex mode
nmap Q <Nop>
" Disable command line mode
map q: <Nop>
" Map buffer switching
let mapleader = "ø"
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l
nmap <leader><leader> <C-W><C-W>
" Map æ to end of line
nmap æ $



" NERDTree Settings
"
" Always show hidden files by default
let g:NERDTreeShowHidden = 1
" Start NERDTree on startup. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Toogle NERDTree keymap
nnoremap <leader>n :NERDTreeToggle<cr>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif



" Macros
"
" Append ';' at EOL
function! AppendSemicolon()
	let save_pos = getpos(".")
	normal! A;
	call setpos(".", save_pos)
	normal! a
endfunction
" Map macro to <Shift-k>
map K :call AppendSemicolon()<CR>

