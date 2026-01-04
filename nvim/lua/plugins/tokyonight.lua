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
            hl.DiffAdd                = { fg = "none", bg = "#222f2f" } -- Unstaged add
            hl.GitSignsStagedAdd      = { fg = "none", bg = "#223524" } -- Staged add indicator
            hl.GitSignsStagedAddLn    = { fg = "none", bg = "#223524" } -- Staged add

            -- Change
            hl.DiffChange             = { fg = "none", bg = "#112244" } -- Unstaged change
            hl.GitSignsStagedChange   = { fg = "none", bg = "#323f44" } -- Staged change indicator
            hl.GitSignsStagedChangeLn = { fg = "none", bg = "#323f44" } -- Staged change

            -- hl.GitSignsAddInline      = { fg = "none", bg = "red" }
            -- hl.GitSignsDeleteInline   = { fg = "none", bg = "red" }
            -- hl.GitSignsChangeInline   = { fg = "none", bg = "red" }

            -- hl.GitSignsAddLnInline    = { fg = "none", bg = "red" }
            -- hl.GitSignsDeleteLnInline = { fg = "none", bg = "red" }
            -- hl.GitSignsChangeLnInline = { fg = "none", bg = "red" }

            -- hl.GitSignsStagedDelete   = { fg = "none", bg = "red" }
            -- hl.GitSignsStagedDeleteLn = { fg = "none", bg = "red" }

        end,
      })
  end
}
