return {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
        "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
        vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
        -- vim.cmd [[autocmd VimLeavePre * windo Neotree close]]
        -- vim.cmd [[autocmd VimEnter * windo Neotree filesystem show]]
        require('auto-session').setup {
            auto_session_pre_save_cmds = { 'Neotree close' },
            -- auto_session_post_restore_cmds = { 'Neotree filesystem show' },
        }

        -- Open neotree on session
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.cmd("Neotree filesystem show")
            end,
        })
    end
}
