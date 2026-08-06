return {
    {
        'nvim-lualine/lualine.nvim',
        cond = not vim.g.vscode,
        event = 'VeryLazy',
        opts = {
            options = {
                theme = 'tokyonight',
            },
        },
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
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
}
