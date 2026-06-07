return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "neovim/nvim-lspconfig",
        {
            "folke/neodev.nvim",
            opts = {},
            config = function(_,opts)
                require("neodev").setup(opts)
            end
        }
    }
}
