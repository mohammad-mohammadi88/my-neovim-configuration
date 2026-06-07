require("auto-session").setup({
    auto_restore_enabled = false,
    -- all directories
    auto_session_suppress_dirs = { "/" }
})

local map = vim.keymap.set

map("n","<leader>asr", "<cmd>AutoSession restore<CR>", { desc = "Restore session for cwd" })
map("n","<leader>ass", "<cmd>AutoSession save<CR>", { desc = "Save session for auto session root dir" })

