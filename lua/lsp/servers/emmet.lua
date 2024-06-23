local M = {}

local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

function M.setup()
    vim.g.tagalong_verbose = 1
    --
    -- local lspconfig = require("lspconfig")
    -- local configs = require("lspconfig/configs")

    -- local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- if not lspconfig.emmet_ls then
    --     configs.emmet_ls = {
    --         default_config = {
    --             cmd = { DATA .. "/lsp_servers/emmet_ls/node_modules/.bin/emmet-ls", "--stdio" },
    --             filetypes = { "html", "css", "javascriptreact", "typescriptreact", "sass", "scss" },
    --             root_dir = function(fname)
    --                 return vim.loop.cwd()
    --             end,
    --             settings = {},
    --         },
    --     }
    -- end
    lspconfig.emmet_ls.setup {
        cmd = { DATA .. "/mason/bin/emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "sass", "scss" },
        init_options = {
            html = {
                options = {
                    ["bem.enable"] = false,
                },
            },
        },
        capabilities = capabilities,
    }
end

return M
