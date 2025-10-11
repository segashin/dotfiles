local colorscheme = 'catppuccin'
print('setting colorscheme ' .. colorscheme)


if colorscheme == 'nightfox' or colorscheme == 'carbonfox' then
    require('nightfox').setup({
        options = {
            -- dim_inactive = true,
        },
        groups = {
            nightfox = {
                NormalFloat = { fg = nil, bg = 'gray18' },
                FloatBorder = { fg = 'firebrick', bg = 'gray18' },
            },
            carbonfox = {
                NormalFloat = { fg = nil, bg = 'gray20' },
                FloatBorder = { fg = 'chartreuse4', bg = 'gray20' },
            },
        }
    })
end

-- if colorscheme == 'catppuccin' or colorscheme == 'catppuccin-mocha' then
--     require('catppuccin').setup({
--         custom_highlights = function(colors)
--             return {
--                 Normal        = { fg = 'none', bg = 'gray4' },
--                 NormalNC      = { fg = 'none', bg = 'gray8' },
--                 TabLineSel    = { fg = 'none', bg = 'gray4' },
--                 TabLine       = { fg = 'none', bg = 'gray24' },
-- 
--                 -- Core diff groups (plugins like Diffview & gitsigns link to these)
--                 diffAdded     = { fg = colors.green, bg = "#1f3cff" },
--                 diffRemoved   = { fg = colors.red, bg = "#3c1f1f" },
--                 diffChanged   = { fg = colors.yellow, bg = "#3c381f" },
--                 diffIndexLine = { fg = colors.teal, bg = "#2e3c3c" },
--                 diffLine      = { fg = colors.overlay0, bg = "#2a2a3a" },
--                 diffFile      = { fg = colors.blue, bg = "#2a2a3a" },
--                 diffNewFile   = { fg = colors.mauve, bg = "#2e2a3c" },
--                 diffOldFile   = { fg = colors.peach, bg = "#3c2a2a" },
--             }
--         end
--     })
-- end

vim.cmd("colorscheme " .. colorscheme)
