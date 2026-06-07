vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local map = vim.keymap.set

		opts.desc = "Show LSP references"
		map("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go To declataion"
		map("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "See available code actions"
		map({ "n", "v" }, "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)

		opts.desc = "Smart rename"
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostic"
		map("n", "<leader>D", "<cmd>Telescope diagnostic bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostic"
		map("n", "<leader>do", vim.diagnostic.open_float, opts)

		opts.desc = "Show documentation for what is under cursor"
		map("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		map("n", "<leader>rs", ":LspRestart<CR>", opts)

		map("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})
local signs = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = "󰌵 ",
	[vim.diagnostic.severity.INFO] = " ",
}

vim.diagnostic.config({
	signs = {
		text = signs,
	},
	virtual_text = {
		prefix = "●",
	},
	undate_in_insert = true,
	underline = true,
	severity_sort = true,
})
