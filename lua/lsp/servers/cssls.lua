-- npm install -g vscode-css-languageserver-bin
local M = {}

local capabilities = require("lsp").capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

function M.setup()
    vim.lsp.config("cssls", {
        cmd = {
            DATA .. "/mason/bin/vscode-css-language-server",
            "--stdio",
        },
        on_attach = require("lsp").common_on_attach,
        settings = {
            css = {
                validate = true,
            },
            scss = {
                validate = true,
            },
        },
        capabilities = capabilities,
    })
end

return M
