-- Diagnostic floating window style
vim.diagnostic.config({
  float = { border = "single" },
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 2, prefix = "●", source = true },
  severity_sort = true,
})

-- To instead override globally
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "single"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- The following settings are defined in /lua/config/colorscheme.lua
-- - change NormalFloat color
-- - change FloatBorder color

-- The following settings are defined in /lua/config/keymaps.lua
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
