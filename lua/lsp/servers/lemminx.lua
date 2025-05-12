local M = {}
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

function M.setup()
    lspconfig.lemminx.setup({
        cmd = { DATA .. "/mason/bin/lemminx" },
        filetypes = { "xml" },
        root_dir = util.root_pattern(".git", "."),
        single_file_support = true,
    })
end

return M
