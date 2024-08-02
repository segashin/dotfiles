local colorscheme = 'carbonfox'
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
        FloatBorder = { fg = 'firebrick', bg = 'gray20' }
      },
    }
  })
end
vim.cmd("colorscheme " .. colorscheme)
