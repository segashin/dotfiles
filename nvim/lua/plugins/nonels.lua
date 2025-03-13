return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup()
        end,
    },
    {
        "zeioth/none-ls-autoload.nvim",
        event = "BufEnter",
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim"
        },
        opts = {}
    }
}
