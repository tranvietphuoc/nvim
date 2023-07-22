local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig").gopls.setup({
        cmd = { DATA .. "/mason/bin/gopls" },
        flags = lsp_flags,
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod" },
        settings = {
            gopls = {
                analyses = { unusedparams = true },
                staticcheck = true,
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
        root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
    })
end

return M