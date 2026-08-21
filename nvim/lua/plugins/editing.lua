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
    {
        'chrisgrieser/nvim-spider',
        keys = {
            { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
            { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
            { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
            { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
        },
    },
}
