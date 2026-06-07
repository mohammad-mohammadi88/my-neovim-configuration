return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"nvim-treesitter/nvim-treesitter",
		"onsails/lspkind.nvim",
		"roobert/tailwindcss-colorizer-cmp.nvim",
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
}
