local devicons = require("nvim-web-devicons")

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

function _G.MyTabLine()
	local s = ""
	local current_tab = vim.fn.tabpagenr()

	-- count dublicate filenames
	local name_count = {}

	for i = 1, vim.fn.tabpagenr("$") do
		local win = vim.fn.tabpagewinnr(i)
		local buf = vim.fn.tabpagebuflist(i)[win]

		local filename = vim.api.nvim_buf_get_name(buf)
		local name = vim.fn.fnamemodify(filename, ":t")

		if name ~= "" then
			name_count[name] = (name_count[name] or 0) + 1
		end
	end
	for i = 1, vim.fn.tabpagenr("$") do
		local current = i == vim.fn.tabpagenr()

		local hl = current and "%#TabLineSel#" or "%#TabLine#"
		local sep_hl = "%#TabLineFill#"

		local win = vim.fn.tabpagewinnr(i)
		local buf = vim.fn.tabpagebuflist(i)[win]

		local filename = vim.api.nvim_buf_get_name(buf)
		local name = vim.fn.fnamemodify(filename, ":t")

		if name == "" then
			name = "[No Name]"
		else
			-- Only show folder if duplicate
			if name_count[name] > 1 then
				local parent = vim.fn.fnamemodify(filename, ":h:t")
				if parent ~= "" then
					name = parent .. "/" .. name
				end
			end
		end

		local ext = vim.fn.fnamemodify(filename, ":e")
		local icon = devicons.get_icon(name, ext, {
			default = true,
		})
		local modified = vim.bo[buf].modified and " ●" or ""

		s = s .. sep_hl .. "|" .. hl .. " " .. icon .. " " .. name .. modified .. " "
	end

	s = s .. "%#TabLineFill#|"
	return s
end
