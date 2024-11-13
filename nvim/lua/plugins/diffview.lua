return {
    'sindrets/diffview.nvim',
    config = function()
        vim.keymap.set('n', '<leader>vg', ':DiffviewOpen<CR>', {})
    end,
}
