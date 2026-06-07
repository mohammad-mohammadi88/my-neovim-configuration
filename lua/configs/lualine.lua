local lualine = require("lualine")
local lazy_status = require("lazy.status")

local colors = {
    text = "#092236",
    pink = "#ff5874",
    light = "#e9f7ff",
    terminal = "#7dcfff",
    light_blue = "#00abff",
    normal = "#ff9b00",
    branch = "#006900",
    dark = "#1c1e26",
    gray = "#a1aab8",
    visual = "#ae81ff",
}

local my_lualine_theme = {
    replace = {
        a = { fg = colors.text, bg = colors.pink, gui = "bold" },
        b = { fg = colors.light, bg = colors.branch, gui = "bold" },
    },
    inactive = {
        a = { fg = colors.gray, bg = colors.dark, gui = "bold" },
        b = { fg = colors.gray, bg = colors.branch, gui = "bold" },
        c = { fg = colors.gray, bg = colors.dark },
    },
    normal = {
        a = { fg = colors.text, bg = colors.normal, gui = "bold" },
        b = { fg = colors.light, bg = colors.branch, gui = "bold" },
        c = { fg = colors.light, bg = colors.dark },
    },
    visual = {
        a = { fg = colors.text, bg = colors.visual, gui = "bold" },
        b = { fg = colors.light, bg = colors.branch, gui = "bold" },
    },
    insert = {
        a = { fg = colors.text, bg = colors.light_blue, gui = "bold" },
        b = { fg = colors.light, bg = colors.branch, gui = "bold" },
    },
    terminal = {
        a = { fg = colors.text, bg = colors.terminal, gui = "bold" },
    }
}

local mode = {
    "mode",
    fmt = function(str)
        return " " .. str
    end
}

local diff = {
    "diff",
    colored = true,
    symbols = { added = "", modified = "", removed = "" }
}

local filename = {
    "filename",
    cond = function()
        return vim.bo.buftype ~= "terminal"
    end,
    file_status = true,
    path = 1
}

local branch = {
    "branch",
    icon = {
        "",
        color = { fg = "#ffffff", gui = "bold" }
    },
    "|"
}

lualine.setup({
    icons_enabled = true,
    options = { theme = my_lualine_theme },
    sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = { diff, filename },
        lualine_x = {
            {
                lazy_status.updates,
                cond = lazy_status.has_updates,
                color = { fg = colors.normal }
            },
            { "searchcount"  },
            { "fileformat", color = { fg = "#000000", bg = colors.normal, gui = "bold" } },
            { "windows" },
        },
    }
})
