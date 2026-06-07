local wilder = require("wilder")

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option(
    "renderer",
    wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        min_width = "20%",
        max_height = "15%",
        reverse = 0,
        highlighter = {
            wilder.lua_pcre2_highlighter(),
            wilder.lua_fzy_highlighter(),
        },
        highlights = {
            default = wilder.make_hl(
                "WilderPopupMenu",
                "Pmenu",
                { { a = 1 }, { a = 1 }, { background = "#1e212b" } }
            ),
            accent = wilder.make_hl(
                "WilderAccent",
                "Pmenu",
                { { a = 1 }, { a = 1 }, { foreground = "#58ffd6", background = "#1e1e2e" } }
            )
        },
        border = "single"
    }))
)
