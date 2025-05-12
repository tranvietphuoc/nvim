local M = {}

local lspconfig = require("lspconfig")

function M.setup()
    lspconfig["yamlls"].setup({
        cmd = { DATA .. "/mason/bin/yaml-language-server", "--stdio" },
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
