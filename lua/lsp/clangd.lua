local M = {}
local lsputils = require("lsp.utils")

function M.setup()
    require("lspconfig").clangd.setup({
        cmd = { DATA .. "/lsp_servers/clangd/clangd_13.0.0/bin/clangd" },
        on_attach = require("lsp").common_on_attach,
        -- handlers = {
        --       ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        --         virtual_text = true,
        --         signs = true,
        --         underline = true,
        --         update_in_insert = true,
        -- 		  })
        -- }
        handlers = lsputils.lsp_diagnostics(),
    })
end

return M
