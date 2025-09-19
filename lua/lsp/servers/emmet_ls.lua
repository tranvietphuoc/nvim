local M = {}

local capabilities = require("lsp").capabilities()
local util = require("lspconfig").util

function M.setup()
    vim.g.tagalong_verbose = 1
    --
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("emmet_ls", {
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
        root_dir = util.root_pattern(".git", vim.fn.getcwd()),
    })
end

return M
