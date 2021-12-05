local M = {}

function M.setup()
    require("lspconfig").solargraph.setup({
        cmd = { DATA .. "/lsp_servers/solang/solang" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig/util").find_git_ancestor,
    })
end

return M
