return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        'hrsh7th/cmp-buffer',
    },
        'hrsh7th/cmp-path',
    {
        'hrsh7th/cmp-cmdline',
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            -- Completion settings general
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<TAB>"] = cmp.mapping.select_next_item(),
                    ["<s-TAB>"] = cmp.mapping.select_prev_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    -- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    -- ["<C-Space>"] = cmp.mapping.complete(),
                    -- ["<C-e>"] = cmp.mapping.abort(),
                }),
                experimental = {
                    -- ghost_text = true,
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                    { name = "path" },
                    { name = "cmdline" },
                }, {
                    { name = "buffer" },
                }),
            })
            -- Completion settings /
            cmp.setup.cmdline('/', {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                { name = 'buffer' }
              }
            })
            -- Completion settings :
            cmp.setup.cmdline(":", {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                { name = "path" },
                { name = "cmdline" },
              },
            })
        end,
    },
}