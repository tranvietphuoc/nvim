local M = {}

function M.setup()
    require("lspconfig").solang.setup({
        cmd = { DATA .. "/lsp_servers/solang/solang", "--language-server", "--target", "ewasm" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig/util").find_git_ancestor(),
    })
end

return M
