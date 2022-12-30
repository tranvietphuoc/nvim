local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    vim.g.tagalong_verbose = 1
    --
    -- local lspconfig = require("lspconfig")
    -- local configs = require("lspconfig/configs")

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
    require("lspconfig")["emmet_ls"].setup({
        cmd = { DATA .. "/mason/bin/emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "sass", "scss" },
        flags = lsp_flags,
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
