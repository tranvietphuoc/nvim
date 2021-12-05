local M = {}

function M.setup()
    require("lspconfig").yamlls.setup({
        cmd = { DATA .. "/lsp_servers/yaml/node_modules/.bin/yaml-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                },
            },
        },
    })
end

return M
