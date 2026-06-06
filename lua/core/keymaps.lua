local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>ss", vim.cmd.w, { desc = "Save current file" })
map("n", "<leader>s", vim.cmd.w, { desc = "Save current file" })
map("n", "<leader>so", vim.cmd.so, { desc = "Source current lua file " })
map("n", "<leader>q", vim.cmd.q, { desc = "to quit current tab" })
map("n", "<leader>qq", "<cmd>q!<CR>", { desc = "to quit current tab by force" })
map("n", "<leader>aq", vim.cmd.qa, { desc = "to quit all tabs and neovim" })
map("n", "<leader>sa", vim.cmd.wa, { desc = "to save add files" })
map("n", "<C-a>", "ggVG", { desc = "to select to whole text in current tab" })
map("n", "<leader>ter", function()
	vim.cmd("belowright split | terminal")
end, { desc = "open terminal" })
map("n", "U", vim.cmd.redo, { desc = "redo" })
map("n", "I", "a")

-- noops
map({ "n", "v" }, "s", "<Nop>", opts)
map({ "n", "v" }, "x", "<Nop>", opts)
map({ "v", "n" }, "<leader>d", "<Nop>", opts)
map("n", "<leader>r", "<Nop>", opts)
map("n", "r", "<Nop>", opts)

-- Move line down
map("n", "<M-j>", ":m .+1<CR>==")
-- Move line up
map("n", "<M-k>", ":m .-2<CR>==")

-- insert
map("i", "<M-j>", "<Esc>:m .+1<CR>==gi", { desc = "move line down in insert mode", silent = true })
map("i", "<M-k>", "<Esc>:m .-2<CR>==gi", { desc = "move line up in insert mode", silent = true })

-- visual
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection", silent = true })

-- indent selected lines
map("v", "{", "<gv", opts)
map("v", "}", ">gv", opts)

-- indent current line
map("n", "}", ">>", opts)
map("n", "{", "<<", opts)

-- clipboard
map("n", "<C-c>", ":nohl<CR>", { desc = "unhighlights the highlighted text", silent = true })

map("n", "<leader>fo", vim.lsp.buf.format, { desc = "format files" })
map("n", "<leader>rr", [[:%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]], { desc = "Replace word cursor in on globally" })
map("n", "<leader>cpp", "<cmd>!rcpp %<CR>", { desc = "compile and run the current cpp file" })
map("n", "<leader>X", "<cmd>!chmod +x %<CR>", { desc = "makes current file executable", silent = true })
map("n", "<leader>x", "<cmd>!./% <CR>", { desc = "executes current file", silent = true })

-- Tabs
map("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "tc", "<cmd>tabclose<CR>", { desc = "Close the current tab" })
map("n", "tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
map("n", "tp", "<cmd>tabp<CR>", { desc = "go to previous tab" })
map("n", "tf", "<cmd>tabnew %<CR>", { desc = "open current tab in a new tab" })

-- Split
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })
map("n", "<leader>sn", "<C-w>w", { desc = "Switch to next split" })
map("n", "<leader>sp", "<C-w>W", { desc = "Switch to prev split" })
