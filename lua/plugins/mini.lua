return {
	{ "nvim-mini/mini.nvim", version = false },
	{
		"nvim-mini/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa",
				delete = "sd",
				find = "sf",
				find_left = "sF",
				highlight = "sh",
				replace = "sr",
				suffix_last = "l",
				suffix_next = "n",
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
	{
		"nvim-mini/mini.trailspace",
		event = { "BufReadPost", "BufNewFile" },
	},
}
