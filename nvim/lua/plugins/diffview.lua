return {
    'sindrets/diffview.nvim',
    config = function()
        vim.keymap.set('n', '<leader>vd', ':DiffviewOpen<CR>', {})
        vim.keymap.set('n', '<leader>vc', ':DiffviewClose<CR>', {})
        vim.keymap.set('n', '<leader>vv', ':DiffviewFileHistory % --base=LOCAL<CR>', {})
        vim.keymap.set('n', '<leader>vf', ':DiffviewFileHistory %<CR>', {})
    end,
}
