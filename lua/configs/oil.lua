local oil = require("oil")

oil.setup({
    default_file_explorer = true,
    colomns = { },
    keymaps = {
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-t>"] = { "actions.select", opts = { tob = true } },
        ["q"] = "actions.close"
    },
    delete_to_trash = true,
    view_options = {
        show_hidden = true
    },
    skip_confirm_for_simple_edits = true
})

vim.keymap.set("n", "cd", "<CMD>Oil<CR>", { desc = "open parent directory" })
vim.keymap.set("n", "<leader>cd", require("oil").toggle_float,{ desc = "toggle float oil" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        vim.opt_local_cursorline = true
    end
})
