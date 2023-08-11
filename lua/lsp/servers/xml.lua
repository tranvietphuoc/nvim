local M = {}

function M.setup()
    require("lspconfig").lemminx.setup({
        cmd = { DATA .. "/mason/bin/lemminx" },
        filetypes = { "xml" },
        root_dir = require("lspconfig").util.find_git_ancestor(),
        single_file_suppport = true,
    })
end

return M
