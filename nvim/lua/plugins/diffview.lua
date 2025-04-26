return {
    'sindrets/diffview.nvim',
    config = function()
        vim.keymap.set('n', '<leader>vo', ':DiffviewOpen<CR>', {})
        vim.keymap.set('n', '<leader>qv', ':DiffviewClose<CR>', {})
        vim.keymap.set('n', '<leader>vbc', ':DiffviewFileHistory<CR>', {})
        vim.keymap.set('n', '<leader>vfc', ':DiffviewFileHistory %<CR>', {})
        vim.keymap.set('n', '<leader>vfbl', ':DiffviewFileHistory % --base=LOCAL<CR>', {})
    end,
}
