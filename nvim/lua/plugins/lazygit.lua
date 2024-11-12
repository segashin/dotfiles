return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>gt", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        { "<leader>gT", "<cmd>lua require('telescope').extensions.lazygit.lazygit()<cr>", desc = "LazyGit" },
    },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
}
