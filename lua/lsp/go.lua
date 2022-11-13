local M = {}

function M.setup()
    require("lspconfig").gopls.setup({
        cmd = { DATA .. "/mason/bin/gopls" },
        cmd_env = {
            GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
        },
        filetypes = { "go", "gomod" },
        settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
        root_dir = require("lspconfig").util.root_pattern(".git", "go.mod"),
        init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
    })
end

return M
