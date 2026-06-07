local opts = {
    explorer = {
        enabled = true,
        layout = {
            cycle = false,
        }
    },
    quickfile = {
        enabled = true,
        exclude = {"latex"}
    },
    picker = {
        prompt = "🔍 ",
        enabled = true,
        matchers = {
            frecency = true,
            cwd_bonus = true,
        },
        formatters = {
            file = {
                filename_first = false,
                filename_only = false,
                icon_width = 2
            }
        },
        layout = {
            preset = "telescope",
            cycle = true
        },
        layouts = {
            select = {
                preview = false,
                layout = {
                    backdrop = false,
                    width = 0.6,
                    min_width = 80,
                    height = 0.4,
                    min_height = 10,
                    box = "vertical",
                    border = "rounded",
                    title = "{title}",
                    title_pos = "center",
                    { win = "input", height = 1, border = "bottom" },
                    { win = "list", border = "none" },
                    { win = "preview", title = "{preview}", width = 0.6, height = 0.4, border = "top" },
                }
            },
            telescope = {
                reverse = true,
                layout = {
                    box = "horizontal",
                    backdrop = true,
                    width = 0.8,
                    height = 0.9,
                    border = "rounded",
                    {
                        box = "vertical",
                        { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
                        { win = "input", height = 1,border = "rounded",title = "{title} {live} {flags}", title_pos = "center" }
                    },
                    {
                        win = "preview",
                        title = "{preview:Preview}",
                        width = 0.5,
                        border = "rounded",
                        title_pos = "center"
                    }
                }
            }
        }
    },
}

return {
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        ---@class snacks.dashboard.Config
        ---@field enabled? boolean
        ---@field sections snacks.dashboard.Section
        ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
        enabled = true,
        opts = opts,
        keys = {
            { "<leader>rf", function() Snacks.rename.rename_file() end, desc = "Rename the current file" },
            { "<leader>df", function() Snacks.bufdelete() end, desc = "Delete the current file" },
            { "<leader>sx", function() Snacks.explorer() end, desc = "Open Snacks Explorer" },

            -- Picker
            { "<leader>ff", function() Snacks.picker.files() end, desc = "Search and find files" },
            { "<leader>rg", function() Snacks.picker.grep() end, desc = "Search for words in files" },
            { "<leader>vst", function() Snacks.picker.grep_word() end, desc = "Search Visual selected text", mode = { "n", "x" } },
            { "<leader>km", function() Snacks.picker.keymaps({ layout = "ivy" }) end, desc = "Search Keymaps" },
            { "<leader>theme", function() Snacks.picker.colorschemes({ layout = "ivy" }) end, desc = "Pick Color Schemes" },
            { "<leader>help", function() Snacks.picker.help() end, desc = "Help Pages" },
        },
    },
    -- {
    --     "folke/todo-comments.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     keys = {
    --         { "<leader>tc", function() require("snacks").picker.todo_comments() end, desc = "Todo" },
    --         { "<leader>tC", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    --     }
    -- }
}

