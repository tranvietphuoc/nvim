-- npm install -g typescript typescript-language-server
local M = {}

local util = require("lspconfig.util")
local local_utils = require("lsp.utils")
local lspconfig = require("lspconfig")

function M.setup()
    -- typescript-tools
    require("typescript-tools").setup {
        on_attach = function() end,
        handlers = {},
        settings = {
            -- spawn additional tsserver instance to calculate diagnostics on it
            separate_diagnostic_server = true,
            -- "change"|"insert_leave" determine when the client asks the server about diagnostic
            publish_diagnostic_on = "insert_leave",
            -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
            -- "remove_unused_imports"|"organize_imports") -- or string "all"
            -- to include all supported code actions
            -- specify commands exposed as code_actions
            expose_as_code_action = {},
            -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
            -- not exists then standard path resolution strategy is applied
            tsserver_path = nil,
            -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
            -- (see 💅 `styled-components` support section)
            tsserver_plugins = {},
            -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
            -- memory limit in megabytes or "auto"(basically no limit)
            tsserver_max_memory = "auto",
            -- described below
            tsserver_format_options = {},
            tsserver_file_preferences = {},
            -- locale of all tsserver messages, supported locales you can find here:
            -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
            tsserver_locale = "en",
            -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
            complete_function_calls = false,
            include_completions_with_insert_text = true,
            -- CodeLens
            -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
            -- possible values: ("off"|"all"|"implementations_only"|"references_only")
            code_lens = "off",
            -- by default code lenses are displayed on all referencable values and for some of you it can
            -- be too much this option reduce count of them by removing member references from lenses
            disable_member_code_lens = true,
            -- JSXCloseTag
            -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
            -- that maybe have a conflict if enable this feature. )
            jsx_close_tag = {
                enable = false,
                filetypes = { "javascriptreact", "typescriptreact" },
            },
            tsserver_file_preferences = {
                includeInlayParameterNameHints = "all",
                includeCompletionsForModuleExports = true,
                quotePreference = "auto",
            },
            tsserver_format_options = {
                allowIncompleteCompletions = false,
                allowRenameOfImportPath = false,
            }
        },
    }
    -- lspconfig.tsserver.setup {
    --     cmd = { DATA .. "/mason/bin/typescript-language-server", "--stdio" },
    --
    --     filetypes = {
    --         "javascript",
    --         "javascriptreact",
    --         "javascript.jsx",
    --         "typescript",
    --         "typescriptreact",
    --         "typescript.tsx",
    --     },
    --     -- on_attach = require("lsp").tsserver_on_attach,
    --     single_file_support = true,
    --     init_options = {
    --         hostInfo = "neovim",
    --     },
    --     on_attach = require("lsp").common_on_attach,
    --     root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    --     settings = {
    --         documentFormatting = true,
    --         typescript = {
    --             inlayHints = {
    --                 includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    --                 includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --                 includeInlayFunctionParameterTypeHints = true,
    --                 includeInlayVariableTypeHints = true,
    --                 includeInlayPropertyDeclarationTypeHints = true,
    --                 includeInlayFunctionLikeReturnTypeHints = true,
    --                 includeInlayEnumMemberValueHints = true,
    --             },
    --         },
    --         javascript = {
    --             inlayHints = {
    --                 includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    --                 includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --                 includeInlayFunctionParameterTypeHints = true,
    --                 includeInlayVariableTypeHints = true,
    --                 includeInlayPropertyDeclarationTypeHints = true,
    --                 includeInlayFunctionLikeReturnTypeHints = true,
    --                 includeInlayEnumMemberValueHints = true,
    --             },
    --         },
    --     },
    --     -- handlers = {
    --     --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
    --     --         virtual_text = false,
    --     --         signs = true,
    --     --         underline = false,
    --     --         update_in_insert = false,
    --     --     }),
    --     -- },
    --     handlers = local_utils.lsp_diagnostics(),
    -- }
end

return M
