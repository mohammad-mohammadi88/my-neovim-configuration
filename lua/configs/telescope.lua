-- local builtin = require("telescope.builtin")
-- local telescope = require("telescope")
-- local actions = require("telescope.actions")
--
-- -- telescope.load_extension("fzf")
-- telescope.load_extension("themes")
--
-- telescope.setup({
--     defaults = {
--         path_display = { "smart" },
--         mappings = {
--             i = {
--                 ["<C-k>"] = actions.move_selection_previous,
--                 ["<C-j>"] = actions.move_selection_next,
--             }
--         },
--         extensions = {
--             themes = {
--                 enable_previewer = true,
--                 enable_live_preview = true,
--                 persist = {
--                     enabled = true,
--                     path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
--                 }
--             }
--         }
--     }
-- })
--
local map = vim.keymap.set

map("n", "<leader>pf", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files", silent = true })
map("n", "<leader>ttheme", "<cmd>Telescope themes<CR>", { silent = true })
