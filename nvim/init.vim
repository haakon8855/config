" Håkjell's nvim config

" Set runtime path so config files auto-resolve relative paths
lua vim.opt.runtimepath:prepend(vim.fn.expand('~/git/config/nvim'))

" Vimscript config
"
" General UI settings
execute 'source ' . expand('~/git/config/nvim/vim/settings.vim')
" Key bindings
execute 'source ' . expand('~/git/config/nvim/vim/keymaps.vim')
" Special autocommands
execute 'source ' . expand('~/git/config/nvim/vim/autocmds.vim')
" Commands
execute 'source ' . expand('~/git/config/nvim/vim/commands.vim')

" Lua config
"
" Load general UI settings
lua require('config.settings')
" Bootstrap lazy.nvim and load plugins
lua require('config.lazy')

