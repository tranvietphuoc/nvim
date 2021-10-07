local M = {}

function M.setup()
    vim.g.indent_blankline_buftype_exclude = { "terminal" }
    vim.g.indent_blankline_filetype_exclude = { "man", "help", "dashboard", "packer", "markdown" }
    vim.g.indent_blankline_char = "▏"
    vim.g.indent_blankline_show_current_context = true
end

return M
