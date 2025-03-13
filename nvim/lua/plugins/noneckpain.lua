return {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function()
        require('no-neck-pain').setup({
            width = 120,
            autocmds = {
                enableOnVimEnter = false,
            },
            integrations = {
                neotree = {
                    position = "left",
                    reopen = true,
                },
                aerial = {
                    position = "right",
                    reopen = true,
                },
            },
        })
        vim.keymap.set('n', '<leader>ws', ':NoNeckPain<CR>', {})
    end
}
