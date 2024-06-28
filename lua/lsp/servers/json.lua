-- npm install -g vscode-json-languageserver
local M = {}


local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.jsonls.setup({
        cmd = {
            -- "node",
            DATA .. "/mason/bin/vscode-json-language-server",
            "--stdio",
        },
        on_attach = require("lsp").common_on_attach,

        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                end,
            },
        },
    })
end

return M
