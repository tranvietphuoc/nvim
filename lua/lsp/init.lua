local lsputils = require("lsp.utils")
local ih = require("lsp-inlayhints")

local M = {}

local function map(...)
    vim.keymap.set(...)
end

function M.common_on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    lsputils.lsp_highlight(client, bufnr)
    ih.on_attach(client, bufnr, true)
    -- lsp config
    -- map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "gR", vim.lsp.buf.references, opts)
    -- map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
    map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
    map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>') -- scala metals
    map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    -- map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    -- map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    -- map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    -- lspsaga
    -- lsp finder
    map("n", "gh", "<cmd>Lspsaga lsp_finder<CR><CR>")
    -- code actions
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
    -- signature help
    map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
    -- go to definition
    -- map("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
    -- Use <C-t> to jump back
    map("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
    -- Use <C-t> to jump back
    map("n", "gP", "<cmd>Lspsaga peek_type_definition<CR>")
    -- Go to type definition
    map("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
    -- rename
    -- map("n", "gR", "<cmd>Lspsaga rename ++project<CR>")
    -- Rename all occurrences of the hovered word for the entire file
    map("n", "gr", "<cmd>Lspsaga rename<CR>")
    -- diagnostics
    map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
    -- show_line_diagnostics
    map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>")
    -- show cursor diagnostics
    map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
    -- show buf diagnostics
    map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
    -- toggle outline
    map("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
    -- hover
    map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
    -- Only jump to error
    map("n", "[E", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    map("n", "]E", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)

    -- Call hierarchy
    map("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
    map("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")


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
    require("lsp.servers.bash").setup()
    require("lsp.servers.cpp").setup()
    require("lsp.servers.cmake").setup()
    require("lsp.servers.css").setup()
    require("lsp.servers.docker").setup()
    require("lsp.servers.go").setup()
    require("lsp.servers.html").setup()
    require("lsp.servers.python").setup()
    require("lsp.servers.rust").setup()
    require("lsp.servers.tsserver").setup()
    require("lsp.servers.vim").setup()
    require("lsp.servers.vue").setup()
    require("lsp.servers.yaml").setup()
    require("lsp.servers.sql").setup()
    require("lsp.servers.tex").setup()
    require("lsp.servers.lua").setup()
    require("lsp.servers.tailwindcss").setup()
    require("lsp.servers.emmet").setup()
    require("lsp.servers.solidity").setup()
    require("lsp.servers.scala").setup()
    require("lsp.servers.csharp").setup()
    require("lsp.servers.verilog").setup()
    require("lsp.cmp").setup()
    require("lsp.nullls").setup()
end

return M
