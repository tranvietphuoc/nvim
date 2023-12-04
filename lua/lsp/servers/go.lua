local M = {}


local utils = require("lspconfig.util")
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

function M.setup()
    lspconfig["gopls"].setup {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
            gopls = {
                analyses = { unusedparams = true },
                assign = true,
                atomic = true,
                composites = true,
                completeUnimported = true,
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
        -- single_file_support = true,
        root_dir = utils.root_pattern("go.mod", "go.work", ".git"),
        -- init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,

    }
end

return M
