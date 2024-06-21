local M = {}

function M.setup()
    vim.g.gitblame_date_format = "%r"
    vim.g.gitblame_message_template = "   <committer> • <sha> • <summary> • <date> • <author>"
    vim.g.gitblame_enabled = 1
    vim.g.gitblame_highlight_group = "Question"
end

return M
