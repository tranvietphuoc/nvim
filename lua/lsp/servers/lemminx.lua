local M = {}
local util = require("lspconfig.util")

function M.setup()
    vim.lsp.config("lemminx", {
        cmd = { DATA .. "/mason/bin/lemminx" },
        filetypes = { "xml" },
        root_dir = util.root_pattern(".git", "."),
        single_file_support = true,
    })
    vim.lsp.enable("lemminx")
end

return M
