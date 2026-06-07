local ufo = require("ufo")

ufo.setup({
	provider_selector = function()
		return { "treesitter", "indent" }
	end,
	open_fold_hl_timeout = 0,
})

local opt = vim.o

opt.foldenable = true
opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99

local map = vim.keymap.set
map("n", "zr", ufo.openAllFolds)
map("n", "zm", ufo.closeAllFolds)
