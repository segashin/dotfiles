return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("hlchunk").setup({
            chunk = {
                enable = true,
                style = {
                    "#2bab34", -- moss green
                    "#ab2ba2", -- maple red
                },
                -- animation reated
                duration = 120,
                delay = 5
            },
            line_num = {
                enable = true,
                style = "#a8d98b",
            },
            indent = {
                enable = true,
            },
            blank = {
                enable = true,
            }
        })
    end
}
