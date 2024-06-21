local M = {}


local lspconfig = require("lspconfig")
local util = require 'lspconfig.util'
local async = require 'lspconfig.async'
local capabilities = require("lsp").capabilities()
local mod_cache = '/Users/phuoc/go/pkg/mod'

function M.setup()
    vim.g.go_fmt_command = "goimports"
    lspconfig.gopls.setup {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = function(fname)
            -- see: https://github.com/neovim/nvim-lspconfig/issues/804
            if not mod_cache then
                local result = async.run_command 'go env GOMODCACHE'
                if result and result[1] then
                    mod_cache = vim.trim(result[1])
                end
            end
            if fname:sub(1, #mod_cache) == mod_cache then
                local clients = vim.lsp.get_clients { name = 'gopls' }
                if #clients > 0 then
                    return clients[#clients].config.root_dir
                end
            end
            return util.root_pattern 'go.work' (fname) or util.root_pattern('go.mod', '.git')(fname)
        end,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                hoverKind = "FullDocumentation",
                vulncheck = "Imports",
                usePlaceholders = true,
                staticcheck = true,
                gofumpt = true,
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
        single_file_support = true,
        -- root_dir = util.root_pattern("go.mod", "go.work", ".git"),
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,

    }
end

return M
