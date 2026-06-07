local miniTrailspace = require("mini.trailspace")

miniTrailspace.setup({
    only_in_normal_buffers = true
})

vim.keymap.set("n","<leader>cw", function() miniTrailspace.trim() end, { desc = "Clear Whitespace" })
