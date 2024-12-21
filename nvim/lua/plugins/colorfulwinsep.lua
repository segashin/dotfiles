return {
    'nvim-zh/colorful-winsep.nvim',
    event = { "WinLeave" },
    config = function()
        local colorfulwinsep = require('colorful-winsep')
        colorfulwinsep.setup({
            hi = {
                fg = "DeepSkyBlue3",
            }
        })
    end,
}
