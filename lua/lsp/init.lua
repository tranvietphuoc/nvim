local M = {}

local local_utils = require("lsp.utils")
local ih = require("lsp-inlayhints")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local function map(...)
    vim.keymap.set(...)
end

function M.capabilities()
    return cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
end

function M.attach(client, bufnr)
    map('n', '[d', vim.diagnostic.goto_prev)
    map('n', ']d', vim.diagnostic.goto_next)
    map('n', '<leader>e', vim.diagnostic.open_float)
    map('n', '<leader>q', vim.diagnostic.setloclist)


    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')


    -- lsp config
    opts.desc = "Restart LSP"
    map("n", "<leader>rs", ":LspRestart<cr>", opts) -- mapping to restart lsp if necessary

    opts.desc = "Show hover docs"
    map("n", "K", vim.lsp.buf.hover, opts)
    opts.desc = "Show declaration"
    map("n", "gD", vim.lsp.buf.declaration, opts)
    opts.desc = "Go to definitions"
    map("n", "gd", vim.lsp.buf.definition, opts)
    opts.desc = "Go to implementations"
    map("n", "gi", vim.lsp.buf.implementation, opts)
    opts.desc = "Show references"
    map("n", "gR", vim.lsp.buf.references, opts)
    opts.desc = "Show signature help"
    map("n", "gs", vim.lsp.buf.signature_help, opts)
    map("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>")
    map("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>")
    map("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>")
    map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<cr>') -- scala metals

    -- Lspsaga
    opts.desc = "Lspsaga show lsp_finder"
    map("n", "gh", "<cmd>Lspsaga lsp_finder<cr>", opts) -- lsp finder

    opts.desc = "Lspsaga codeaction"
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts) -- code actions

    -- opts.desc = "Lspsaga go to definitions"
    -- map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts) -- go to definition
    opts.desc = "Lspsaga peek definitions"
    map("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts) -- peek definition
    map("n", "gP", "<cmd>Lspsaga peek_type_definition<CR>")

    opts.desc = "Lspsaga rename"
    map("n", "gr", "<cmd>Lspsaga rename<cr>", opts) -- Rename all occurrences of the hovered word for the entire file


    opts.desc = "Show lsp outline"
    map('n', "<leader>o", "<cmd>Lspsaga outline<cr>", opts) -- show lsp outline

    opts.desc = "Lspsaga show line diagnostics"
    map("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts) -- show_line_diagnostics

    opts.desc = "Lspsaga show cursor diagnostics"
    map("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts) -- show cursor diagnostics

    opts.desc = "Lspsaga show buffer diagnostics"
    map("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts) -- show buf diagnostics

    -- Only jump to error
    map("n", "[E", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end)
    map("n", "]E", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end)


    map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<cr>")
    map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<cr>")


    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

function M.common_on_attach(client, bufnr)
    M.attach(client, bufnr)
    ih.on_attach(client, bufnr, true)

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
    local servers = { "bash", "clang", "cmake", "css", "docker", "docker-compose", "go", "html", "python", "rust",
        "tsserver", "json", "vue", "yaml", "sql", "tex", "lua", "r", "tailwind", "emmet", "solidity", "scala", "cs", "verilog",
        "xml" }


    for _, server in ipairs(servers) do
        require("lsp.servers." .. server).setup()
    end

    require("lsp.cmp").setup()
end

return M
