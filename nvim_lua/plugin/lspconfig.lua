local status, mason = pcall(require, "mason")
if (not status) then print('mason not installed') return end
local status2, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then print('mason_lspconfig not installed') return end
local status3, lspconfig = pcall(require, "lspconfig")
if (not status3) then print('lspconfig not installed') return end
local status4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if (not status4) then print('cmp_nvim_lsp not installed') return end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lspconfig.setup({})
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end
})

-- Language specific settings
--  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim"
        }
      }
    }
  }
}

-- Python
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



-- completion
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<s-TAB>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<TAB>"] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})

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

