local M = {}

function M.setup()
    -- vim.g.user_emmet_leader_key = ","
    -- vim.g.user_emmet_expandabbr_key = ","
    -- vim.g.user_emmet_install_global = 0
    -- vim.g.user_emmet_mode = "iv"
    vim.g.tagalong_verbose = 1
    --
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig/configs")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
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
    lspconfig.emmet_ls.setup({
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
    })
end

return M
