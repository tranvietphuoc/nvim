local function map(...)
    vim.api.nvim_set_keymap(...)
end

local function buf_map(...)
    vim.api.nvim_map(bufnr, ...)
end

local cmd = vim.cmd

local opts = { noremap = true, silent = true }
local lsputils = require("lsp.utils")

local M = {}

function M.common_on_attach(client, bufnr)
    lsputils.lsp_highlight(client, bufnr)
end

function M.tsserver_on_attach(client, bufnr)
    M.common_on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
end

local saga = require("lspsaga")

function M.setup()
    -- lsp saga
    saga.init_lsp_saga({
        -- code_action_prompt = {
        --     enable = true,
        --     sign = true,
        --     sign_priority = 20,
        --     virtual_text = true,
        -- },
    })

    -- lsp config
    -- map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    -- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- lspsaga
    -- lsp finder
    map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", opts)
    -- code actions
    map("n", "<space>ca", "lua require('lspsaga.codeaction').code_action()<CR>", opts)
    -- signature help
    map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    -- preview definition
    map("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)

    -- rename
    map("n", "gr", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
    -- diagnostics
    map("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
    map("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
    -- hover
    map("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
    map("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    map("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
end

return M
