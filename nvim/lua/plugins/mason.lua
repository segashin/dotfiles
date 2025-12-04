return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" },
                automatic_enable = {
                    exclude = {
                        "luals",
                        "pylsp",
                        "dartls",
                        "yamlls",
                        "helm_ls,"
                    }
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        -- dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local lspconfig = require('lspconfig')

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
                },
            })
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                maxLineLength = 88,
                                ignore = { 'E402' },
                                enabled = 0,
                            },
                            flake8 = {
                                maxLineLength = 88,
                                enabled = 1,
                                ignore = { 'E203', 'W503', 'E402' },
                            },
                        }
                    }
                }
            })
            lspconfig.dartls.setup({
                cmd = { "dart", 'language-server', '--protocol=lsp' }
            })
            lspconfig.yamlls.setup({
                settings = {
                    yaml = {
                        schemaStore = {
                            enable = false
                        },
                        schemas = {
                            -- kubernetes = "*.yaml",
                            -- ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                            -- ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                            -- ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                            -- ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                            -- ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                            -- ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                            -- ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                            -- ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                            -- ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                            -- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
                            -- "*api*.{yml,yaml}",
                            -- ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                            -- "*docker-compose*.{yml,yaml}",
                            -- ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
                            -- "*flow*.{yml,yaml}",
                        }
                    }
                }
            })
            lspconfig.helm_ls.setup({
                settings = {
                    ['helm-ls'] = {
                        yamlls = {
                            enabled = false,
                            config = {
                                schemas = {},
                                schemaStore = {
                                    enable = false
                                },
                                completion = true,
                                hover = true,
                                -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
                            }
                        }
                    }
                }
            })
        end
    }
}
