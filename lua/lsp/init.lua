local function map(...)
    vim.api.nvim_set_keymap(...)
end
local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
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
    client.resolved_capabilities.document_formatting = false
end

function M.setup()
    -- lsp config
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
end

return M
