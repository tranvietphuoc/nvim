-- npm install -g typescript typescript-language-server
local M = {}

local utils = require("lspconfig/util")
local local_utils = require("lsp.utils")
local lspconfig = require("lspconfig")

function M.setup()
    require("typescript").setup {
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false,            -- enable debug logging for commands
        go_to_source_definition = {
            fallback = true,      -- fall back to standard LSP definition on failure
        },
        server = {
        },
    }
    lspconfig.tsserver.setup {
        cmd = { DATA .. "/mason/bin/typescript-language-server", "--stdio" },

        filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
        },
        -- on_attach = require("lsp").tsserver_on_attach,
        single_file_support = true,
        init_options = {
            hostInfo = "neovim",
        },
        on_attach = require("lsp").common_on_attach,
        root_dir = utils.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
        settings = {
            documentFormatting = true,
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
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
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
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
        handlers = local_utils.lsp_diagnostics(),
    }
end

return M
