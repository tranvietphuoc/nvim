local M = {}

local solidity = vim.lsp.enable("solidity_ls")

function M.setup()
    vim.lsp.config("solidity_ls", {
        cmd = { DATA .. "/mason/bin/solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = require("lspconfig/util").root_pattern(".git", "package.json"),
    })
    vim.lsp.enable("solidity_ls")
end

return M
