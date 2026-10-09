local function lsp_diagnostics()
    vim.diagnostic.config({
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

    local function with_config(handler, defaults)
        return function(err, result, ctx, config)
            config = vim.tbl_deep_extend("force", {}, defaults, config or {})
            return handler(err, result, ctx, config)
        end
    end

    local on_references = vim.lsp.handlers["textDocument/references"]
    vim.lsp.handlers["textDocument/references"] = with_config(on_references, { loclist = true, virtual_text = true })

    vim.lsp.handlers["textDocument/hover"] = with_config(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = with_config(vim.lsp.handlers.signature_help, {
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
