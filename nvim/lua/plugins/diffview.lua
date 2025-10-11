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

        -- Close diffview on qq or qa
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "DiffviewFiles", "DiffviewFilePanel" },
            callback = function()
                vim.keymap.set("n", "<leader>qq", "<cmd>DiffviewClose<cr>", { buffer = true })
                vim.keymap.set("n", "<leader>qa", "<cmd>DiffviewClose<cr>", { buffer = true })
            end,
        })

        -- Create DiffviewToggle function
        vim.api.nvim_create_user_command("DiffviewToggle", function()
            local ok, lib = pcall(require, "diffview.lib")
            if not ok then
                vim.cmd("DiffviewOpen")
                return
            end
            local view = lib.get_current_view()
            if view then
                vim.cmd("DiffviewClose")
            else
                vim.cmd("DiffviewOpen")
            end
        end, {})
    end,
}
