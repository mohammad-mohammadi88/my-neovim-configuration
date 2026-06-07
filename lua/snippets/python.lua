local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("shebang", {
		t("#!/usr/bin/env python3"),
	}),
	s("pdoc", {
		t({ '"""', "" }),
		i(1, "summery of what function does "),
		t({
			"",
			"Args:",
			"\t",
		}),
		i(2, "param1"),
		t(" ("),
		i(3, "type"),
		t("): "),
		i(4, "description"),
		t({
			".",
			"",
			"\t",
		}),
		i(5, "param2"),
		t(" ("),
		i(6, "type"),
		t("): "),
		i(7, "description"),
		t({
			".",
			"",
			"Returns:",
			"\t",
		}),
		i(8, "type"),
		t(": "),
		i(9, "results description"),
		t({ ".", "", "", "Reises:", "\t" }),
		i(10, "ErrorType"),
		t(": "),
		i(11, "error description"),
		t({ ".", "", '"""' }),
	}),
}
