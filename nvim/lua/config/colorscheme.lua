local colorscheme = 'catppuccin'
print('setting colorscheme ' .. colorscheme)


if colorscheme == 'nightfox' or colorscheme == 'carbonfox' then
  require('nightfox').setup({
    options = {
      -- dim_inactive = true,
    },
    groups = {
      nightfox = {
        NormalFloat = { fg = 'none', bg = 'gray18' },
        FloatBorder = { fg = 'firebrick', bg = 'gray18' }
      },
      carbonfox = {
        NormalFloat = { fg = 'none', bg = 'gray20' },
        FloatBorder = { fg = 'chartreuse4', bg = 'gray20' },
      },
    }
  })
end

if colorscheme == 'catppuccin' then
  require('catppuccin').setup({
        custom_highlights = function(colors)
            return {
                Normal = { fg = 'none', bg = 'gray4' },
                NormalNC = { fg = 'none', bg = 'gray8' },
                TabLineSel = { fg = 'none', bg = 'gray4' },
                TabLine = { fg = 'none', bg = 'gray8' },
            }
        end
  })
end

vim.cmd("colorscheme " .. colorscheme)
