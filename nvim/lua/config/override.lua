-- Set tab width for Dart files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.bo.tabstop = 2          -- Number of spaces for a tab
        vim.bo.shiftwidth = 2       -- Number of spaces for autoindent
        vim.bo.expandtab = true     -- Convert tabs to spaces
    end,
})
