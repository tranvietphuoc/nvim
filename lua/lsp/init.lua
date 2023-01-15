local opts = { noremap = true, silent = true }
local lsputils = require("lsp.utils")
local saga = require("lspsaga")

local M = {}

local function map(...)
    vim.keymap.set(...)
end

function M.common_on_attach(client, bufnr)
    lsputils.lsp_highlight(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
end

function M.tsserver_on_attach(client, bufnr)
    M.common_on_attach(client, bufnr)
    client.server_capabilities.document_formatting = false
end

function M.setup()
    -- lsp saga
    -- saga.init_lsp_saga()
    saga.setup({

        finder_icons = {
            def = "  ",
            ref = "諭 ",
            link = "  ",
        },

        lightbulb = {
            enable = true,
            enable_in_insert = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        diagnostic = {
            twice_into = false,
            show_code_action = true,
            show_source = true,
            keys = {
                exec_action = "o",
                quit = "q",
            },
        },

        outline = {
            win_position = "right",
            win_with = "",
            win_width = 30,
            show_detail = true,
            auto_preview = true,
            auto_refresh = true,
            auto_close = true,
            custom_sort = nil,
            keys = {
                jump = "o",
                expand_collaspe = "u",
                quit = "q",
            },
        },
    })

    -- lsp config
    -- map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>') -- scala metals
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
    map("n", "gh", "<cmd>Lspsaga lsp_finder<CR><CR>", opts)
    -- code actions
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    -- signature help
    map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
    -- preview definition
    map("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    -- rename
    map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
    -- diagnostics
    map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    -- hover
    map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    -- Only jump to error
    map("n", "[E", function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    map("n", "]E", function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, opts)
    -- Outline
    map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

    -- inlayHints
    local inlayhints_config = {
        inlay_hints = {
            parameter_hints = {
                show = true,
                prefix = "<- ",
                separator = ", ",
                remove_colon_start = true,
                remove_colon_end = true,
            },
            type_hints = {
                -- type and other hints
                show = true,
                prefix = "-> ",
                separator = " ",
                remove_colon_start = true,
                remove_colon_end = true,
            },
            only_current_line = false,
            -- separator between types and parameter hints. Note that type hints are
            -- shown before parameter
            labels_separator = ", ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- highlight group
            highlight = "Comment",
            -- virt_text priority
            priority = 0,
        },
        enabled_at_startup = true,
        debug_mode = false,
    }

    require("lsp-inlayhints").setup(inlayhints_config)

    -- lsp clients setup
    require("lsp.bash").setup()
    require("lsp.cpp").setup()
    require("lsp.cmake").setup()
    require("lsp.css").setup()
    require("lsp.docker").setup()
    require("lsp.go").setup()
    require("lsp.html").setup()
    require("lsp.python").setup()
    require("lsp.rust").setup()
    require("lsp.tsserver").setup()
    require("lsp.vim").setup()
    require("lsp.vue").setup()
    require("lsp.yaml").setup()
    require("lsp.sql").setup()
    require("lsp.tex").setup()
    require("lsp.lua").setup()
    require("lsp.tailwindcss").setup()
    require("lsp.emmet").setup()
    require("lsp.solidity").setup()
    require("lsp.cmp").setup()
    require("lsp.nullls").setup()
    require("lsp.scala").setup()
end

return M
