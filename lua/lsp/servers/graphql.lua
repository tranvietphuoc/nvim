-- npm install -g graphql-language-service-cli
local M = {}


local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.graphql.setup({
        cmd = { DATA .. "/mason/bin/graphql-lsp", "server", "-m", "stream" },
        on_attach = require("lsp").common_on_attach,
    })
end

return M
