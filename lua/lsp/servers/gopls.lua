-- local async = require("lspconfig.async")
local capabilities = require("lsp").capabilities()
local mod_cache = "/Users/phuoc/go/pkg/mod"

local function setup()
    vim.g.go_fmt_command = "goimports"
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "gomod", "gowork", "gotmpl" },
        callback = function(ev)
            local root = vim.fs.find({ "go.mod", "go.work", ".git" }, { upward = true, path = vim.api.nvim_buf_get_name(ev.buf) })[1]
            local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

            vim.lsp.start({
                name = "gopls",
                cmd = { DATA .. "/mason/bin/gopls" },
                cmd_env = {
                    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)",
                },
                root_dir = root_dir,
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
            }, {
                bufnr = ev.buf,
            })
        end,
    })
end

return {
    setup = setup,
}
