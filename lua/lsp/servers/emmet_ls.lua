local M = {}

local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

function M.setup()
    vim.g.tagalong_verbose = 1
    --
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.emmet_ls.setup({
        cmd = { DATA .. "/mason/bin/emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "sass", "scss", "xml", "htmldjango" },
        init_options = {
            html = {
                options = {
                    ["bem.enable"] = false,
                },
            },
        },
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
    })
end

return M
