local M = {}

function M.setup()
    vim.lsp.config("yamlls", {
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
    vim.lsp.enable("yamlls")
end

return M
