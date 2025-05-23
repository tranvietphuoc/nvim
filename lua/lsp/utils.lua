local M = {}
local util = require("lspconfig.util")

--[[ function M.lsp_highlight(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })
    end
end ]]

function M.lsp_diagnostics()
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

--[[ function M.lsp_config(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = { border = "single" },
    })

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(...)
    end

    buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Key mappings
    local keymap = require("utils.keymap")
    for mode, mapping in pairs(lsp_keymappings) do
        keymap.map(mode, mapping)
    end

    -- LSP and DAP menu
    local whichkey = require("config.whichkey")
    whichkey.register_lsp(client)

    if client.name == "tsserver" or client.name == "jsonls" then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end
 ]]
function M.lsp_init(client, bufnr)
    -- LSP init
end

function M.lsp_exit(client, bufnr)
    -- LSP exit
end

--[[ function M.lsp_attach(client, bufnr)
    M.lsp_config(client, bufnr)
    M.lsp_highlight(client, bufnr)
    M.lsp_diagnostics()
end ]]

function M.setup()
    M.lsp_diagnostics()
end

return M
