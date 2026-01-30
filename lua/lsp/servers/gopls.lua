-- local async = require("lspconfig.async")
local capabilities = require("lsp").capabilities()
local mod_cache = "/Users/phuoc/go/pkg/mod"

local function setup()
    vim.g.go_fmt_command = "goimports"
    vim.lsp.config("gopls", {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
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

return {
    setup = setup,
}
