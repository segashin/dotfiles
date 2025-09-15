return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        local neotree = require("neo-tree")
        neotree.setup({
            close_if_last_window = true,
            window = {
                position = "left",
                width = math.floor(vim.o.columns / 5),
                mappings = {
                    ["N"] = { "add", config = { show_path = "none" } },
                    ["y"] = { "copy" },
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    ["t"] = "open_tabnew",
                },
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                }
            }
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.cmd("Neotree filesystem show")
            end,
        })
    end
}
