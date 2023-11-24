local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig").gopls.setup({
        cmd = { DATA .. "/mason/bin/gopls", "-remote.debug=:0" },
        flags = lsp_flags,
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
            gopls = {
                analyses = {
                    unreachable = true,
                    nilness = true,
                    unusedparams = true,
                    useany = true,
                    unusedwrite = true,
                    ST1003 = true,
                    undeclaredname = true,
                    fillreturns = true,
                    nonewvars = true,
                    fieldalignment = false,
                    shadow = true,
                },
                usePlaceholders = true,
                completeUnimported = true,
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
        root_dir = require("lspconfig.util").root_pattern("go.mod", "go.work"),
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
    })
end

return M
