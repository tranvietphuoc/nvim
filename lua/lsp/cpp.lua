local M = {}
local lsputils = require("lsp.utils")

function M.setup()

    require('clangd_extensions').setup({
        server = {
            cmd = { DATA .. "/mason/bin/clangd" },
            on_attach = require("lsp").common_on_attach,
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc", "h", "hpp" },
            handlers = lsputils.lsp_diagnostics(),

        },
        extensions = {
            -- defaults:
            -- Automatically set inlay hints (type hints)
            autoSetHints = false,
        },
        ast = {
            -- These are unicode, should be available in any font
            role_icons = {
                type = "🄣",
                declaration = "🄓",
                expression = "🄔",
                statement = ";",
                specifier = "🄢",
                ["template argument"] = "🆃",
            },
            kind_icons = {
                Compound = "🄲",
                Recovery = "🅁",
                TranslationUnit = "🅄",
                PackExpansion = "🄿",
                TemplateTypeParm = "🅃",
                TemplateTemplateParm = "🅃",
                TemplateParamObject = "🅃",
            },
            highlights = {
                detail = "Comment",
            },
        },

    })
end

return M
