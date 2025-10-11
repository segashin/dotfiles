return {
    'sindrets/diffview.nvim',
    lazy = true,
    dependency = {
        "catppuccin/nvim",
    },
    config = function()
        local actions = require("diffview.actions")
        require("diffview").setup({
            enhanced_diff_hl = false,
            view = {
                default = {
                    layout = "diff2_horizontal"
                }
            }
        })
    end,
}
