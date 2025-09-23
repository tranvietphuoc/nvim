local M = {}

local async = require("lspconfig.async")
local capabilities = require("lsp").capabilities()
local mod_cache = "/Users/phuoc/go/pkg/mod"

function M.setup()
    vim.g.go_fmt_command = "goimports"
    vim.lsp.config("gopls", {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = function(fname)
            -- see: https://github.com/neovim/nvim-lspconfig/issues/804
            if not mod_cache then
                local result = async.run_command("go env GOMODCACHE")
                if result and result[1] then
                    mod_cache = vim.trim(result[1])
                end
            end
            if fname:sub(1, #mod_cache) == mod_cache then
                local clients = vim.lsp.get_clients({ name = "gopls" })
                if #clients > 0 then
                    return clients[#clients].config.root_dir
                end
            end
            local root_dir = vim.fs.find({ "go.work", "go.mod", ".git" }, { upward = true, path = fname })[1]
            return vim.fs.dirname(root_dir)
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
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,
    })
    vim.lsp.enable("gopls")
end

return M
