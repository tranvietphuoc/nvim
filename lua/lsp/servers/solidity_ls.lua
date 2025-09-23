local M = {}

local solidity = vim.lsp.enable("solidity_ls")

function M.setup()
    vim.lsp.config("solidity_ls", {
        cmd = { DATA .. "/mason/bin/solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json" }, { upward = true })[1]),
    })
    vim.lsp.enable("solidity_ls")
end

return M
