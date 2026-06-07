local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("hello", {
		t('cout << "Hello, World!" << endl;'),
	}),
	s("hpp", {
		t("#ifndef "),
		i(1, "File_Name"),
		t({
			"",
			"#define ",
		}),
		i(1, "File_Name"),
		t({ "", "" }),
		i(0),
		t({ "", "", "#endif" }),
	}),
	s("cpp", {
		t({ "#include <iostream>", "", "using namespace std;", "", "", "int main() {", "\t" }),
		i(0),
		t({ "", "", "\treturn 0;", "}", "" }),
	}),
	s("namespace", {
		t("using namespace "),
		i(1, "std"),
		t({ ";", "" }),
	}),
}
