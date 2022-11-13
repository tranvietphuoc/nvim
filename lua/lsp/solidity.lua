local M = {}

function M.setup()
    require("lspconfig").solidity_ls.setup({
        cmd = { DATA .. "/mason/bin/solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig/util").root_pattern(".git", "package.json"),
    })
end

return M
