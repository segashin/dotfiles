return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            custom_highlights = function(colors)
                return {
                    Normal                 = { fg = 'none', bg = 'gray4' },
                    NormalNC               = { fg = 'none', bg = 'gray8' },
                    TabLineSel             = { fg = 'none', bg = 'gray4' },
                    TabLine                = { fg = 'none', bg = 'gray24' },

                    -- Diff colors
                    DiffAdd                = { fg = "none", bg = "#113311" },
                    DiffChange             = { fg = "none", bg = "#112244" },
                    DiffDelete             = { fg = "none", bg = "#551144" },
                    DiffText               = { fg = 'none', bg = '#2222aa', bold = true },

                    -- Git colors
                    GitSignsAddInline      = { fg = "none", bg = "red" },
                    GitSignsDeleteInline   = { fg = "none", bg = "red" },
                    GitSignsChangeInline   = { fg = "none", bg = "red" },

                    GitSignsAddLnInline    = { fg = "none", bg = "red" },
                    GitSignsDeleteLnInline = { fg = "none", bg = "red" },
                    GitSignsChangeLnInline = { fg = "none", bg = "red" },

                    GitSignsStagedAdd      = { fg = "none", bg = "green" },
                    GitSignsStagedAddLn    = { fg = "none", bg = "green" },
                    GitSignsStagedChange   = { fg = "none", bg = "blue" },
                    GitSignsStagedChangeLn = { fg = "none", bg = "blue" },
                    GitSignsStagedDelete   = { fg = "none", bg = "red" },
                    GitSignsStagedDeleteLn = { fg = "none", bg = "red" }
                }
            end
        })
    end
}
