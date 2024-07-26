return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({})
                end
            })

            -- Language specific settings
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                      diagnostics = {
                        globals = {
                          "vim"
                        }
                      }
                    }
                }
            })
            lspconfig.pylsp.setup {
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      maxLineLength = 119
                    }
                  }
                }
              }
            }
        end
    }
}
