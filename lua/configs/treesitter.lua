local treesitter = require("nvim-treesitter.config")

treesitter.setup({
    highlight = {
        enable = true
    },
    indent = { enable = true },
    ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "python",
        "html",
        "yaml",
        "css",
        "sass",
        "scss",
        "prisma",
        "http",
        "vim",
        "dockerfile",
        "c",
        "java",
        "rust",
        "vimdoc",
        "markdown",
        "graphql",
        "lua",
        "bash",
        "cpp",
        "gitignore"
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false
        }
    },
    additional_vim_regex_highlighting = false
})
