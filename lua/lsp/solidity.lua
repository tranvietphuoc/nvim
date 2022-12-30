local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")["solidity_ls"].setup({
        cmd = { DATA .. "/mason/bin/solidity-language-server", "--stdio" },
        filetypes = { "solidity" },
        flags = lsp_flags,
        root_dir = require("lspconfig/util").root_pattern(".git", "package.json"),
    })
end

return M
