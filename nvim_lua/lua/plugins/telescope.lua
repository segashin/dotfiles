return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local fb_actions = require "telescope".extensions.file_browser.actions
            telescope.setup({
                defaults = {
                    hidden = true,
                    layout_strategy = "flex",
                    layout_config = {
                      flex = {
                        width = 0.95,
                        flip_columns = 110, -- turn to horizontal mode if there is less column than this
                        flip_lines = 40, -- turn to vertical mode if there is more lines than this
                      },
                    },
                    mappings = {
                      n = {
                        ["q"] = actions.close,
                        ["H"] = "which_key",
                      },
                    },
                    preview = {
                      filesize_limit = 0.5,
                      mime_hook = function(filepath, bufnr, opts)
                          local is_image = function(filepath)
                          local image_extensions = {'png','jpg', 'jpeg', 'PNG'}   -- Supported image formats
                          local split_path = vim.split(filepath:lower(), '.', {plain=true})
                          local extension = split_path[#split_path]
                          return vim.tbl_contains(image_extensions, extension)
                        end
                        if is_image(filepath) then
                          local term = vim.api.nvim_open_term(bufnr, {})
                          local function send_output(_, data, _ )
                            for _, d in ipairs(data) do
                              vim.api.nvim_chan_send(term, d..'\r\n')
                            end
                          end
                          vim.fn.jobstart(
                            {
                              'catimg', filepath  -- Terminal image viewer command
                            },
                            {on_stdout=send_output, stdout_buffered=true, pty=true})
                        else
                          require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
                        end
                      end
                    },
                  },
            })
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require('telescope')
            local actions = require('telescope.actions')
            local fb_actions = require "telescope".extensions.file_browser.actions
            telescope.setup({
              extensions = {
                file_browser = {
                  -- theme = "ivy",
                  display_stat = false,
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
            })
            telescope.load_extension('file_browser')
            vim.keymap.set('n', '<leader>fv', ':<C-u>Telescope file_browser path=%:p:h slsect_buffer=true<CR>', {})
        end

    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            local telescope = require('telescope')
            telescope.setup({
              extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- add options here
                    }
                },
              },
            })
            telescope.load_extension('ui-select')
        end
    }
}
