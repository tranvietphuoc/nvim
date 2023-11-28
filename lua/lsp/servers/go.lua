local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local utils = require("lspconfig.util")
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

function M.setup()
    lspconfig.gopls.setup {
        cmd = { DATA .. "/mason/bin/gopls", "--remote=auto" },
        -- cmd = { "gopls" },
        flags = lsp_flags,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
            gopls = {
                analyses = { unusedparams = true },
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
        root_dir = utils.root_pattern("go.mod", "go.work", ".git"),
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,

    }
end

return M
