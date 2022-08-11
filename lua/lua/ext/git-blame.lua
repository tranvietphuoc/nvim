local M = {}

function M.setup()
    vim.g.gitblame_date_format = "%r"
    vim.g.gitblame_message_template = "<summary> • <date> • <author>"
    vim.g.gitblame_enabled = 1
end

return M
