return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",

			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Python
			"mfussenegger/nvim-dap-python",

			-- JS / TS
			{
				"mxsdev/nvim-dap-vscode-js",
				dependencies = {
					"microsoft/vscode-js-debug",
					build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
				},
			},
		},
	},
}
