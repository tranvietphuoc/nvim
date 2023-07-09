local M = {}

function M.setup()
    vim.opt.termguicolors = true
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    -- vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup({
        -- char = "|",
        space_char_highlight_list = {
            "IndentBlanklineIndent2",
        },
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
    })
end

return M
