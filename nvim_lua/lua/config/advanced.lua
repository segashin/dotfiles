-- Show border of the diagnostic floating window
vim.diagnostic.config({
  float = { border = "single" }
})

-- Diagnostic highlighting
vim.lsp.handlers["textDocument/publishDiakgnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 2, prefix = "●", source = true },
    severity_sort = true,
  }
)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single", -- "single" "shadow", "none", "rounded"
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
vim.api.nvim_create_augroup("LSPCursorHold", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "LSPCursorHold",
    callback = function()
        -- vim.lsp.buf.hover()
        vim.diagnostic.open_float()
    end
})
