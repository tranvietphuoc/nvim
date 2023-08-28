local lsputils = require("lsp.utils")
local ih = require("lsp-inlayhints")

local M = {}

local function map(...)
    vim.keymap.set(...)
end

function M.common_on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- lsputils.lsp_attach(client, bufnr)
    -- lsputils.lsp_highlight(client, bufnr)
    -- lsputils.lsp_diagnostics()
    ih.on_attach(client, bufnr, true)



    -- lsp config
    opts.desc = "Show LSP references"
    map('n', 'gR', '<cmd>Telescope lsp_references<cr>', opts) -- show definitions, references

    opts.desc = "Go to declaration"
    map('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definition"
    map('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', opts) -- show lsp definitions

    opts.desc = "Show LSP implementation"
    map('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    map('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', opts) -- show lsp type definitions

    opts.desc = "See all available code actions"
    map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to see selection

    -- opts.desc = "Smart rename"
    -- map("n", "<leader>rn", ":IncRename ", opts) -- smart rename

    opts.desc = "Show buffer diagnostics"
    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = "Show line diagnostics"
    map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = "Go to previous diagnostic"
    map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = "Go to next diagnostic"
    map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

    map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")


    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- inlayHints setup
    local ih_config = {
        inlay_hints = {
            parameter_hints = {
                show = true,
                prefix = "<- ",
                separator = ", ",
                remove_colon_start = false,
                remove_colon_end = true,
            },
            type_hints = {
                -- type and other hints
                show = true,
                prefix = "",
                separator = ", ",
                remove_colon_start = false,
                remove_colon_end = false,
            },
            only_current_line = false,
            -- separator between types and parameter hints. Note that type hints are
            -- shown before parameter
            labels_separator = " ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- highlight group
            highlight = "LspInlayHint",
            -- virt_text priority
            priority = 0,
        },
        enabled_at_startup = true,
        debug_mode = false,
    }
    ih.setup(ih_config)
end

function M.tsserver_on_attach(client, bufnr)
    M.common_on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
end

function M.setup()
    -- lsp clients setup
    --

    require("lsp.servers.bash").setup()
    require("lsp.servers.clang").setup()
    require("lsp.servers.cmake").setup()
    require("lsp.servers.css").setup()
    require("lsp.servers.docker").setup()
    require("lsp.servers.go").setup()
    require("lsp.servers.html").setup()
    require("lsp.servers.python").setup()
    require("lsp.servers.rust").setup()
    require("lsp.servers.tsserver").setup()
    require("lsp.servers.json").setup()
    require("lsp.servers.vim").setup()
    require("lsp.servers.vue").setup()
    require("lsp.servers.yaml").setup()
    require("lsp.servers.sql").setup()
    require("lsp.servers.tex").setup()
    require("lsp.servers.lua").setup()
    require("lsp.servers.tailwind").setup()
    require("lsp.servers.emmet").setup()
    require("lsp.servers.solidity").setup()
    require("lsp.servers.scala").setup()
    require("lsp.servers.cs").setup()
    require("lsp.servers.verilog").setup()
    require("lsp.servers.xml").setup()
    require("lsp.cmp").setup()
end

return M
