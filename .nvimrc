" Haakon's nvimrc



" Set background shell to use (only on Windows)
set shell=cmd.exe



" Plugins (vim.pack)
"
lua << EOF
-- Build hook for markdown-preview. Register BEFORE vim.pack.add so it
-- fires on the very first install (fresh-machine bootstrap).
vim.api.nvim_create_autocmd('PackChanged', {
	callback = function(ev)
		if ev.data.spec.name == 'markdown-preview.nvim'
			and (ev.data.kind == 'install' or ev.data.kind == 'update') then
			if not ev.data.active then
				vim.cmd.packadd('markdown-preview.nvim')
			end
			vim.fn['mkdp#util#install']()
		end
	end
})

-- Disable netrw (recommended by nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Loaded everywhere, including inside the VSCode extension
local plugins = {
  'https://github.com/kylechui/nvim-surround',
}

-- UI/editor plugins we skip inside VSCode
if not vim.g.vscode then
  vim.list_extend(plugins, {
    'https://github.com/iamcco/markdown-preview.nvim',
    'https://github.com/mofiqul/vscode.nvim',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-tree/nvim-tree.lua',
    'https://github.com/lewis6991/gitsigns.nvim',
	{ src = 'https://github.com/ms-jpq/coq_nvim', version = 'coq' },
	{ src = 'https://github.com/ms-jpq/coq.artifacts', version = 'artifacts' },
	'https://github.com/folke/which-key.nvim',
	'https://github.com/windwp/nvim-autopairs',
  })
end

-- Load plugins
vim.pack.add(plugins)

-- Configure global plugins
require('nvim-surround').setup()

-- Configure non-vscode plugins
if not vim.g.vscode then
	vim.cmd.colorscheme('vscode')
	require('gitsigns').setup()
	require('ibl').setup()
	require('coq').setup()
	require('which-key').setup()
	require('nvim-autopairs').setup()
	require('lualine').setup({
		options = {
			icons_enabled = false,
			theme = 'codedark',
		}
	})
	require('nvim-tree').setup({
		view = {
			width = 40
		},
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
	vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { link = 'Directory' })
end

-- Enable highlighted yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function() vim.hl.on_yank() end,
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



" Spell check
"
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
let mapleader = "ø"
nmap <leader>h <C-W>h
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>l <C-W>l
nmap <leader><leader> <C-W><C-W>
" Toggle tree
nmap <leader>t <cmd>NvimTreeToggle<CR>
" Map æ to end of line
nmap æ $
" Capitalize first letter of current word
nnoremap <leader>u wbvU
" Split current line at char 80 with linebreak
nnoremap <leader>m 081lF<Space>s<CR><Esc>
" Remap spell check suggestions to øz
nnoremap <leader>z z=


