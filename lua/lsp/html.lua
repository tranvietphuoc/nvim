-- npm install -g vscode-html-languageserver-bin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local M = {}

function M.setup()
    require("lspconfig")["html"].setup({
        cmd = { DATA .. "/mason/bin/vscode-html-language-server", "--stdio" },
        -- cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,
        flags = lsp_flags,
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
