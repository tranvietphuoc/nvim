local function lsp_diagnostics()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = false,
        float = {
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    local on_references = vim.lsp.handlers["textDocument/references"]
    vim.lsp.handlers["textDocument/references"] = vim.lsp.with(on_references, { loclist = true, virtual_text = true })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_init(client, bufnr)
    -- LSP init
end

local function lsp_exit(client, bufnr)
    -- LSP exit
end

return {
    lsp_diagnostics = lsp_diagnostics,
    lsp_init = lsp_init,
    lsp_exit = lsp_exit,
    setup = function()
        lsp_diagnostics()
    end,
}
