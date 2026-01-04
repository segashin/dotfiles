return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            on_highlights = function(hl, c)
                hl.Normal                 = { fg = 'none', bg = 'gray8' }

                -- Line colors representing git status
                -- hl.DiffDelete             = { fg = "none", bg = "#551144" }
                -- hl.DiffText               = { fg = 'none', bg = '#2222aa', bold = true }

                -- Add
                hl.GitSignsAdd            = { fg = "#225a2f", bg = "none" }     -- Add indicator
                hl.GitSignsAddLn              = { fg = "none", bg = "#222f2f" } -- Add
                hl.GitSignsStagedAdd      = { fg = "#22bf2f", bg = "none" }     -- Staged add indicator
                hl.GitSignsStagedAddLn    = { fg = "none", bg = "#323f54" }     -- Staged add

                -- Change
                hl.GitSignsChange         = { fg = "#2255aa", bg = "none" }     -- Change indicator
                hl.GitSignsChangeLn           = { fg = "none", bg = "#112244" } -- Change
                hl.GitSignsStagedChange   = { fg = "#2222ff", bg = "none" }     -- Staged change indicator
                hl.GitSignsStagedChangeLn = { fg = "none", bg = "#323f54" }     -- Staged change

                -- Delete
                hl.GitSignsDelete         = { fg = "#662244", bg = "none" }     -- Delete indicator
                hl.GitSignsDeleteLn           = { fg = "none", bg = "#351144" } -- Delete
                hl.GitSignsStagedDelete   = { fg = "#ff1144", bg = "none" }     -- Staged delete indicator
                hl.GitSignsStagedDeleteLn = { fg = "none", bg = "#323f54" }     -- Staged delete

                -- -- Change word diff
                -- -- Below does not work: https://github.com/lewis6991/gitsigns.nvim/issues/731
                -- hl.GitSignsChangeLnInline     = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsChangeVirtLnInline = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsChangeInline       = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsAddLnInline        = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsAddVirtLnInline    = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsAddInline          = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsDeleteLnInline     = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsDeleteVirtLnInline = { fg = "#0000ff", bg = "#0000ff"}
                -- hl.GitSignsDeleteInline       = { fg = "#0000ff", bg = "#0000ff"}
            end,
        })
    end
}
