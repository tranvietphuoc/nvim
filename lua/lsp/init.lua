local M = {}

local local_utils = require("lsp.utils")
local ih = require("inlay-hints")
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
    map('n', '<leader>e', vim.diagnostic.open_float) -- open diagnostic buffer with floating window
    map('n', '<leader>q', vim.diagnostic.setloclist) -- open diagnostic buffer


    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    --turn on inlay hints
    -- vim.lsp.inlay_hint(bufnr, true)
    -- toggle inlay hint
    opts.desc = "Toggle inlayhints"
    map("n", '<leader>i', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
        end,
        opts
    )


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



    -- disable ruff hover
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client == nil then
                return
            end
            if client.name == 'ruff' then
                --disable hover in favor of pyright
                client.server_capabilities.hoverProvider = false
            end
        end,
        desc = 'LSP: Disable hover capability from Ruff',
    })


    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

function M.common_on_attach(client, bufnr)
    M.attach(client, bufnr)
    ih.on_attach(client, bufnr) -- enable inlay hints for lsp server
end

function M.tsserver_on_attach(client, bufnr)
    M.common_on_attach(client, bufnr)
    client.server_capabilities.document_formatting = true
end

function M.setup()
    -- lsp clients setup
    --
    local scandir = require("plenary.scandir")

    -- strip the file extension
    local function stripExtension(filepath)
        return filepath:match("(.+)%..+$") or filepath
    end

    -- Function to get the filename from a full path
    local function getFilename(filepath)
        return filepath:match("([^/]+)$")
    end

    -- get a list of files name
    local function listFiles(dir)
        local files = scandir.scan_dir(dir, { hidden = false, add_dirs = false, depth = 1 })
        local filenames = {}
        for _, file in ipairs(files) do
            if file:match("%.lua$") then
                local filename = getFilename(file)
                table.insert(filenames, stripExtension(filename))
            end
        end

        return filenames
    end

    local dir = os.getenv("HOME") .. "/.config/nvim/lua/lsp/servers/"
    local files = listFiles(dir)



    for _, file in ipairs(files) do
        -- print(file)
        require('lsp.servers.' .. file).setup()
    end

    require("lsp.cmp").setup()
end

return M
