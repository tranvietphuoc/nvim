-- npm install -g vscode-css-languageserver-bin
local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig").cssls.setup({
        cmd = {
            DATA .. "/mason/bin/vscode-css-language-server",
            "--stdio",
        },
        flags = lsp_flags,
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
