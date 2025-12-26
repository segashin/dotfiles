return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
      require("tokyonight").setup({
        style = "night",
        on_highlights = function(hl, c)
            hl.DiffAdd                = { fg = "none", bg = "#112a25" }
            hl.DiffChange             = { fg = "none", bg = "#112244" }
            -- hl.DiffDelete             = { fg = "none", bg = "#551144" }
            -- hl.DiffText               = { fg = 'none', bg = '#2222aa', bold = true }
        end,
      })
  end
}
