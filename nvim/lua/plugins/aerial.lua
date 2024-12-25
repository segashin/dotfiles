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
                vim.keymap.set("n", "<leader>ae", "<cmd>AerialToggle!<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<leader>av", "<cmd>AerialNavToggle<CR>", { buffer = bufnr })
                vim.keymap.set("n", "<leader>af", "<cmd>Telescope aerial<CR>")
            end,
            layout = {
                default_direction = "right",
                width = math.floor(vim.o.columns / 3),
                min_width = 25,
                max_width = (0.2),
            },
            attach_mode = "global",
            open_automatic = false,
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.defer_fn(
                    function ()
                        vim.cmd("AerialToggle!")
                    end,
                    1000
                )
            end,
        })
    end,
}
