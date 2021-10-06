local M = {}

function M.setup()
    require("lspconfig").cmake.setup({
        cmd = { DATA .. "/lspinstall/cmake/venv/bin/cmake-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
    })
end

return M
