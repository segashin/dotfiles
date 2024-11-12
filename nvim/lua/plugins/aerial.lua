return {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local aerial = require('aerial')
        aerial.setup({
            on_attach = function(bufnr)
                -- Jump forwards/backwards with '{' and '}'
                vim.keymap.set("n", "[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "]", "<cmd>AerialNext<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<leader>ae", "<cmd>AerialToggle<CR>", { buffer = bufnr })
                vim.keymap.set("n", "fa", "<cmd>Telescope aerial<CR>")
            end,
            layout = {
                default_direction = "prefer_right",
                min_width = 25,
            },
            attach_mode = "global"
        })
    end,
}
