return {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 500,
    config = function()
        local gitsigns = require("gitsigns")
        gitsigns.setup({
            signs                        = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged                 = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable          = true,
            signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            diff_opts                    = {
                internal = true,                 -- Required for word_diff
            },
            watch_gitdir                 = {
                follow_files = true,
            },
            debug_mode                   = true,
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority                = 1000,
            update_debounce              = 2000,
            status_formatter             = nil,  -- Use default
            max_file_length              = 2000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            on_attach                    = function(bufnr)
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Actions
                map('n', '<leader><Space>', gitsigns.stage_hunk)
                -- map('n', '<leader>gr', gitsigns.reset_hunk)
                map('n', '<leader>gl', function()
                    gitsigns.toggle_linehl()
                    gitsigns.toggle_word_diff()
                end)
                map('n', '<leader>g;', gitsigns.toggle_deleted)
                -- map('v', '<leader>vs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                -- map('v', '<leader>vr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                -- map('n', '<leader>hS', gitsigns.stage_buffer)
                -- map('n', '<leader>vu', gitsigns.undo_stage_hunk)
                -- map('n', '<leader>vR', gitsigns.reset_buffer)
                -- map('n', '<leader>vp', gitsigns.preview_hunk)
                map('n', '<leader>gb', function() gitsigns.blame_line { full = true } end)
                -- map('n', '<leader>vt', gitsigns.toggle_current_line_blame)
                -- map('n', '<leader>vf', gitsigns.diffthis)
                -- map('n', '<leader>vF', function() gitsigns.diffthis('~') end)

                -- Text object
                -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                -- map('n', '<leader>vw', gitsigns.toggle_linehl)
            end
        })
    end,
}
