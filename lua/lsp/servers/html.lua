-- npm install -g vscode-html-languageserver-bin
local capabilities = require("lsp").capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true



local function setup()
    vim.lsp.config("html", {
        cmd = { DATA .. "/mason/bin/vscode-html-language-server", "--stdio" },
        -- cmd = { "vscode-html-language-server", "--stdio" },
        filetypes = { "html" },
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
    vim.lsp.enable("html")
end

return {
    setup = setup,
}
