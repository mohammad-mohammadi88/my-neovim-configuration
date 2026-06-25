local dap = require("dap")
local dapui = require("dapui")

--------------------------------------------------
-- Mason
--------------------------------------------------
require("mason").setup()

require("mason-nvim-dap").setup({
	ensure_installed = {
		"codelldb",
	},
	automatic_installation = true,
})

--------------------------------------------------
-- DAP UI
--------------------------------------------------
dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

--------------------------------------------------
-- Signs
--------------------------------------------------
vim.fn.sign_define("DapBreakpoint", {
	text = "🔴",
	texthl = "DiagnosticError",
	linehl = "",
	numhl = "",
})

vim.fn.sign_define("DapStopped", {
	text = "👉",
	texthl = "DiagnosticWarn",
	linehl = "",
	numhl = "",
})

--------------------------------------------------
-- Keymaps
--------------------------------------------------
vim.keymap.set("n", "<F6>", dap.continue, { desc = "DAP Continue" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "DAP Step Over" })
vim.keymap.set("n", "<F3>", dap.step_into, { desc = "DAP Step Into" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP Step Out" })

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP Conditional Breakpoint" })

vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP Run Last" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
vim.keymap.set("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "DAP Hover" })
vim.keymap.set("n", "<leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "DAP Preview" })

--------------------------------------------------
-- C / C++ / Rust via CodeLLDB
--------------------------------------------------
local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
local codelldb_path = mason_path .. "adapter/codelldb"

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = codelldb_path,
		args = { "--port", "${port}" },
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.configurations.c = dap.configurations.cpp

--------------------------------------------------
-- Python
--------------------------------------------------
local python_path = vim.fn.exepath("python3")
require("dap-python").setup(python_path)

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch current file",
		program = "${file}",
		console = "integratedTerminal",
	},
}

--------------------------------------------------
-- JS / TS
--------------------------------------------------
require("dap-vscode-js").setup({
	debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
	adapters = {
		"pwa-node",
		"pwa-chrome",
		"pwa-msedge",
		"node-terminal",
		"pwa-extensionHost",
	},
})

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch current file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach to process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
			sourceMaps = true,
		},
	}
end

dap.configurations.typescriptreact = dap.configurations.typescript
dap.configurations.javascriptreact = dap.configurations.javascript
