-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local M = {}

function M.setup()
    require("lspconfig").html.setup({
        cmd = { DATA .. "/mason/bin/vscode-html-language-server", "--stdio" },
        -- cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html", "htmldjango" },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,
        init_options = {
            configurationSection = { "html" },
            embeddedLanguages = {
                css = true,
                javascript = true,
            },
        },
    })
end

return M
