local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local fb_actions = require "telescope".extensions.file_browser.actions

vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true })
vim.keymap.set('n', '<leader>fv', ':<C-u>Telescope file_browser path=%:p:h slsect_buffer=true<CR>', { noremap = true })

telescope.setup {
  defaults = {
    hidden = true,
    mappings = {
      n = {
        ["q"] = actions.close,
        -- ["t"] = actions.select_tab,
        ["h"] = "which_key",
      },
    },
  },
  extensions = {
    file_browser = {
      -- theme = "ivy",
      display_stat = { date = false, size = false, mode = false },
      hidden = true,
      initial_mode = "normal",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          -- ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
        },
      },
    },
  },
}

telescope.load_extension("file_browser")
