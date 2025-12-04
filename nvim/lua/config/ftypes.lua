-- Detect yaml files tat's part of helm
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
  },
})
