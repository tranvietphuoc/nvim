local M = {}

function M.setup()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")

    require("indent_blankline").setup({
        char = "▏",
        space_char_blankline = " ",
        show_current_context = true,
    })
end

return M
