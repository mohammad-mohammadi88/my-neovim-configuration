vim.api.nvim_create_autocmd(
    { "BufEnter", "WinEnter", "BufWritePost" },
    {
        callback = function()
            local buf = vim.api.nvim_get_current_buf()
            local lines = vim.api.nvim_buf_line_count(buf)

            vim.api.nvim_buf_set_extmark(buf, vim.api.nvim_create_namespace("eof_padding"), lines, 0, {
                virt_lines = {
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                    { { "", "Normal" } },
                },
                virt_lines_above = false,
            })
        end,
    }
)
