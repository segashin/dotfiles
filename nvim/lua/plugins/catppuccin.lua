return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            custom_highlights = function(colors)
                return {
                    Normal     = { fg = 'none', bg = 'gray4' },
                    NormalNC   = { fg = 'none', bg = 'gray8' },
                    TabLineSel = { fg = 'none', bg = 'gray4' },
                    TabLine    = { fg = 'none', bg = 'gray24' },

                    -- Diff colors
                    DiffAdd    = { fg = "none", bg = "#115522" },
                    DiffChange = { fg = "none", bg = "#112233" },
                    DiffDelete = { fg = "none", bg = "#551144" },
                    DiffText   = { fg = 'none', bg = '#2222aa', bold = true },
                }
            end
        })
    end
}
