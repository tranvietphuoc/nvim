-- npm install -g @tailwindcss/language-server
local M = {}

function M.setup()
    require("lspconfig").tailwindcss.setup({
        cmd = { DATA .. "/mason/bin/tailwindcss-language-server", "--stdio" },
        filetypes = {
            "css",
            "svelte",
            "markdown",
            "vue",
        },
        init_options = {
            useLanguages = {},
        },
        on_new_config = function(new_config)
            if not new_config.settings then
                new_config.settings = {}
            end
            if not new_config.settings.editor then
                new_config.settings.editor = {}
            end
            if not new_config.settings.editor.tabSize then
                -- set tab size for hover
                new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
            end
        end,
        -- root_dir = require("lspconfig/util").root_pattern("tailwind.config.js", "postcss.config.ts", ".postcssrc", "package.json", "node_modules"),
        -- on_attach = require'lsp'.common_on_attach,
        settings = {
            tailwindCSS = {
                lint = {
                    cssConflict = "warning",
                    invalidApply = "error",
                    invalidConfigPath = "error",
                    invalidScreen = "error",
                    invalidTailwindDirective = "error",
                    invalidVariant = "error",
                    recommendedVariantOrder = "warning",
                },
                validate = true,
            },
        },
    })
end

return M
