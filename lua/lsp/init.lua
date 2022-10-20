local function map(...)
    vim.keymap.set(...)
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
local metals_config = require("metals").bare_config() -- scala

function M.setup()
    -- lsp saga
    saga.init_lsp_saga({})

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
    map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>') -- scala
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

    -- scala metals
    metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
        -- NOTE: You may or may not want java included here. You will need it if you
        -- want basic Java support but it may also conflict if you are using
        -- something like nvim-jdtls which also works on a java filetype autocmd.
        pattern = { "scala", "sbt", "java" },
        callback = function()
            require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
    })
end

return M
