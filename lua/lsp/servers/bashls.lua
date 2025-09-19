local M = {}

local util = vim.lsp.util

function M.setup()
    vim.lsp.config("bashls", {
        cmd = { DATA .. "/mason/bin/bash-language-server", "start" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "sh", "fish", "zsh" },
        root_dir = util.find_git_ancestor,
    })
    vim.lsp.enable("bashls")
end

return M
