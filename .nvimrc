" Haakon's nvimrc



" Important settings
"
" Set background shell to use (only on Windows)
set shell=cmd.exe
" Map leader key
let mapleader = "ø"
let maplocalleader = ","



" Plugins (lazy.nvim)
"
lua << EOF
-- Highlighted yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.hl.on_yank() end,
})

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
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		cond = not vim.g.vscode,
		config = function()
			vim.cmd.colorscheme('tokyonight-night')
		end,
	},
	{
		'kylechui/nvim-surround',
		opts = {},
	},
	{
		'windwp/nvim-autopairs',
		cond = not vim.g.vscode,
		opts = {},
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		cond = not vim.g.vscode,
		main = "ibl",
		event = 'VeryLazy',
		opts = {},
	},
	{
		'nvim-lualine/lualine.nvim',
		cond = not vim.g.vscode,
		event = 'VeryLazy',
		opts = {
			options = {
				icons_enabled = false,
				theme = 'tokyonight',
			},
		},
	},
	{
		'folke/which-key.nvim',
		cond = not vim.g.vscode,
		event = 'VeryLazy',
		opts = {
			icons = {
				mappings = false,
			},
			spec = {
				-- Move lines
				{ '<C-K>', ':m -2<CR>', desc = 'Move line up' },
				{ '<C-J>', ':m +1<CR>', desc = 'Move line down' },

				-- Window navigation
				{ '<leader>h', '<C-w>h', desc = 'Window left' },
				{ '<leader>j', '<C-w>j', desc = 'Window down' },
				{ '<leader>k', '<C-w>k', desc = 'Window up' },
				{ '<leader>l', '<C-w>l', desc = 'Window right' },
				{ '<leader><leader>', '<C-w><C-w>', desc = 'Cycle windows' },

				-- Capitalize first letter of current word
				{ '<leader>u', 'wbvU', desc = 'Capitalize word' },
				-- Split current line at first space before char 80
				{ '<leader>m', '081lF<Space>s<CR><Esc>', desc = 'Split line' },
				-- View spell check suggestions
				{ '<leader>z', 'z=', desc = 'Spell suggestions' },
				-- Go to next wrongly spelled word
				{ 'zn', ']s', desc = 'Next misspelled word' },
			},
		},
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
	{
		'ethanholz/nvim-lastplace',
		cond = not vim.g.vscode,
		event = { 'BufReadPost' },
		opts = {
			lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
			lastplace_ignore_filetype = { 'gitcommit', 'gitrebase', 'svn', 'hgcommit' },
			lastplace_open_folds = true,
		},
	},
	{
		'petertriho/nvim-scrollbar',
		cond = not vim.g.vscode,
		event = 'VeryLazy',
		opts = function()
			local hl = vim.api.nvim_get_hl(0, { name = 'CursorLine' })
			local bg_color = hl.bg and string.format('#%06x', hl.bg) or nil
			return {
				handle = {
					blend = 0,
					color = bg_color,
				},
				handlers = {
					gitsigns = true,
				},
			}
		end,
	},
	{
		'yousefhadder/markdown-plus.nvim',
		cond = not vim.g.vscode,
		ft = 'markdown',
		opts = {},
	},
})
EOF



" Main settings
"
" Use system clipboard
set clipboard=unnamedplus
" Show line numbers (how is this not default on)
set number
" Use relative numbering style
set relativenumber
" Highlight current line
set cursorline
" Case insensitive search
set ignorecase
" Unless you start entering uppercase letters
set smartcase
" Disable bell
set belloff=all
" Set vim to autoindent
set autoindent
" Smartly indent new lines based on context
set smartindent
" Use spaces instead of tab
set expandtab
" Set ruler at column 80 and 100
set colorcolumn=80,100
" Set tab length
set tabstop=4
set softtabstop=4
set shiftwidth=4
augroup filetype_settings
	autocmd!
	autocmd FileType markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" Enable spell check in markdown files
autocmd FileType markdown setlocal spell spelllang=nb,en_gb,en_us



" Keymaps
"
" Append ';' at EOL
nnoremap K m`A;<Esc>``
" Don't yank on paste
xnoremap p "_dP
" Map æ to end of line
nnoremap æ $



" Commands
"
" Convert current file to unix-style line endings (LF)
command! LF set fileformat=unix

