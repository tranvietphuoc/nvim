local M = {}
local lsputils = require("lsp.utils")

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("clangd_extensions").setup({
        server = {
            cmd = { DATA .. "/mason/bin/clangd", "--offset-encoding=utf-16" },
            on_attach = require("lsp").common_on_attach,
            flags = lsp_flags,
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
