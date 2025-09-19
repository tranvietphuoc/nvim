-- npm install -g vscode-json-languageserver
local M = {}

function M.setup()
    vim.lsp.config("jsonls", {
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
    vim.lsp.enable("jsonls")
end

return M
