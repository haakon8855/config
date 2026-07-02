" Haakon's nvimrc



" Important settings
"
" Set background shell to use (only on Windows)
set shell=cmd.exe
" Map leader key
let mapleader = "ø"



" Plugins (lazy.nvim)
"
lua << EOF
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		'git', 'clone', '--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Add plugins
require('lazy').setup({
	{
		'mofiqul/vscode.nvim',
		lazy = false,
		priority = 1000,
		cond = not vim.g.vscode,
		config = function()
		  vim.cmd.colorscheme('vscode')
		end,
	},
	{
		'kylechui/nvim-surround',
		opts = {},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		cond = not vim.g.vscode,
		main = "ibl",
		opts = {},
	},
	{
		'nvim-lualine/lualine.nvim',
		cond = not vim.g.vscode,
		opts = {
			options = {
				icons_enabled = false,
				theme = 'codedark',
			},
		},
	},
	{
		'folke/which-key.nvim',
		cond = not vim.g.vscode,
		opts = {},
	},
	{
		'windwp/nvim-autopairs',
		cond = not vim.g.vscode,
		opts = {},
	},
	{
		'nvim-tree/nvim-tree.lua',
		cond = not vim.g.vscode,
		keys = {
			{ '<leader>t', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle file tree' },
		},
		init = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		config = function()
			require('nvim-tree').setup({
				view = { width = 40 },
				renderer = {
					add_trailing = true,
					icons = {
						show = {
							file = false,
							folder = false,
							folder_arrow = false,
							git = false,
						},
					},
				},
			})
			vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { link = 'Directory' })
			vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { link = 'Directory' })
			vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { link = 'Directory' })
			vim.api.nvim_set_hl(0, 'NvimTreeRootFolderName', { link = 'Directory' })
		end,
	},
	{
		'iamcco/markdown-preview.nvim',
		cond = not vim.g.vscode,
		ft = { 'markdown' },
		cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
		build = function()
			require('lazy').load({ plugins = { 'markdown-preview.nvim' } })
			vim.fn['mkdp#util#install']()
		end,
	},
	{
		'lewis6991/gitsigns.nvim',
		cond = not vim.g.vscode,
		opts = {},
	},
})
EOF



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
" Turn on syntax highlighting.
syntax enable
" Enable spell check in markdown files
autocmd FileType markdown setlocal spell spelllang=nb,en_gb,en_us



" Keymaps
"
" Append ';' at EOL
nnoremap K m`A;<Esc>``
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
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l
nmap <leader><leader> <C-W><C-W>
" Toggle tree
"nmap <leader>t <cmd>NvimTreeToggle<CR>
" Map æ to end of line
nmap æ $
" Capitalize first letter of current word
nnoremap <leader>u wbvU
" Split current line at char 80 with linebreak
nnoremap <leader>m 081lF<Space>s<CR><Esc>
" Remap spell check suggestions to øz
nnoremap <leader>z z=




