-- npm install -g graphql-language-service-cli
local M = {}

function M.setup()
    vim.lsp.config("graphql", {
        cmd = { DATA .. "/mason/bin/graphql-lsp", "server", "-m", "stream" },
        on_attach = require("lsp").common_on_attach,
    })
    vim.lsp.enable("graphql")
end

return M
