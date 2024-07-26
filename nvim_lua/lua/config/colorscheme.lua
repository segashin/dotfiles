local colorscheme = 'nightfox'
print('setting colorscheme ' .. colorscheme)


if colorscheme == 'nightfox' or colorscheme == 'carbonfox' then
  require('nightfox').setup({
    options = {
      dim_inactive = true,
    },
    groups = {
      nightfox = {
        NormalFloat = { fg = 'none', bg = 'gray25' },
        FloatBorder = { fg = 'green4', bg = 'gray25' }
      },
      carbonfox = {
        NormalFloat = { fg = 'none', bg = 'gray20' },
        FloatBorder = { fg = 'green4', bg = 'gray20' }
      },
    }
  })
end
vim.cmd("colorscheme " .. colorscheme)
