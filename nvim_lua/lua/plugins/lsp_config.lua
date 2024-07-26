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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities
                    })
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

            require('vim.lsp.protocol').CompletionItemKind = {
              '󰊄', -- Text
              '󰬔', -- Method
              '󰊕', -- Function
              '', -- Constructor
              '󰬍', -- Field
              '󰬝', -- Variable
              '', -- Class
              '', -- Interface
              '󰕳', -- Module
              '', -- Property
              '', -- Unit
              '', -- Value
              '', -- Enum
              '', -- Keyword
              '', -- Snippet
              '', -- Color
              '', -- File
              '', -- Reference
              '', -- Folder
              '', -- EnumMember
              '', -- Constant
              '', -- Struct
              '', -- Event
              '', -- Operator
              '', -- TypeParameter
            }

            -- Show border of the diagnostic floating window
            vim.diagnostic.config({
              float = { border = "single" }
            })

            -- Cofigure the diagnostic highlighting
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
              vim.lsp.diagnostic.on_publish_diagnostics, {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = "●", source = true },
                severity_sort = true,
              }
            )

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
              vim.lsp.handlers.hover, {
                border = "single", -- "shadow", "none", "rounded"
              }
            )
            -- The following settings are defined in /lua/myscripts/colorscheme.lua
            -- - change NormalFloat color
            -- - change FloatBorder color

            -- The following settings are defined in /lua/myscripts/keymaps.lua
            -- - keymap to show lsp.buf
            -- - keymap to show diagnostics

            -- Diagnostic symbols in the sign column (gutter)
            local signs = { Error = "", Warn = "", Hint = "", Info = " " }
            for type, icon in pairs(signs) do
              local hl = "DiagnosticSign" .. type
              vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end
        end
    }
}
