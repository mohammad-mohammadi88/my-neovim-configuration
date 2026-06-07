local nvchadcolorizer = require("colorizer")
local tailwindcolorizer = require("tailwindcss-colorizer-cmp")

nvchadcolorizer.setup({
    user_default_options = {
        tailwind = true
    },
    filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx" },
})
tailwindcolorizer.setup({
    color_square_width = 2
})
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" },{
    callback = function()
        vim.cmd("ColorizerAttachToBuffer")
    end
})
