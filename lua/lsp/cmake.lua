local M = {}

function M.setup()
    require("lspconfig").cmake.setup({
        cmd = { DATA .. "/mason/bin/cmake-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
    })
end

return M
