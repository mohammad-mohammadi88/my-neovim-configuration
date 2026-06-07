require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ts_ls",
		"html",
		-- "cpp_ls",
		"cssls",
		"tailwindcss",
		"emmet_ls",
	},
})

require("neodev").setup({
	library = {
		vim.api.nvim_get_runtime_file("", true),
	},
	checkThirdParty = true,
})

-- python pyright
vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})
vim.lsp.enable("pyright")

-- lua lua_ls
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			completion = { callSnippet = "Replace" },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})
vim.lsp.enable("lua_ls")

-- typescript(react) ts_ls
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	init_options = {
		preferences = {
			includeCompletionsWithSnippetText = true,
			includeCompletionsForImportStatements = true,
			includeCompletionsForModuleExports = true,
			includeCompletionsForClassMembers = true,
		},
	},
})
vim.lsp.enable("ts_ls")

-- c++
vim.lsp.config("clangd", {
	capabilities = capabilities,
})
vim.lsp.enable("clangd")
