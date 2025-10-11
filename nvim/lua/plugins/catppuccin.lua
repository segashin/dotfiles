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

                    -- Core Diff groups
                    DiffAdd    = { fg = "none", bg = "#2c6f00" },
                    DiffChange = { fg = "none", bg = "#444444" },
                    DiffDelete = { fg = "none", bg = "#590f0d" },
                    DiffText      = { fg = 'none', bg = '#2f3a9c', bold = true },
                }
            end
        })
    end
}
