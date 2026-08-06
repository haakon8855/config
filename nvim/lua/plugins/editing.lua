return {
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
}
