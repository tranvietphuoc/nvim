-- npm install -g typescript typescript-language-server
local M = {}
local utils = require("lspconfig/util")
local lsputils = require("lsp.utils")
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")["tsserver"].setup({
        cmd = { DATA .. "/mason/bin/typescript-language-server", "--stdio" },

        filetypes = {
            "ejs",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        on_attach = require("lsp").tsserver_on_attach,
        flags = lsp_flags,
        -- on_attach = require'lsp'.common_on_attach,
        root_dir = utils.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        settings = {
            documentFormatting = true,
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
        -- handlers = {
        --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
        --         virtual_text = false,
        --         signs = true,
        --         underline = false,
        --         update_in_insert = false,
        --     }),
        -- },
        handlers = lsputils.lsp_diagnostics(),
    })
end

return M
