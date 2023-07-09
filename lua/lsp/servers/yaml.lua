local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig").yamlls.setup({
        cmd = { DATA .. "/mason/bin/yaml-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
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
