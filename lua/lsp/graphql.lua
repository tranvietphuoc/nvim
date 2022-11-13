-- npm install -g graphql-language-service-cli
local M = {}
function M.setup()
    require("lspconfig").graphql.setup({
        cmd = { DATA .. "/mason/bin/graphql-lsp", "server", "-m", "stream" },
        on_attach = require("lsp").common_on_attach
    })
end

return M
