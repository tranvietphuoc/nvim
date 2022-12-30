-- npm install -g vscode-json-languageserver
local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")["jsonls"].setup({
        cmd = {
            -- "node",
            DATA .. "/mason/bin/vscode-json-languageserver",
            "--stdio",
        },
        on_attach = require("lsp").common_on_attach,

        flags = lsp_flags,

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
