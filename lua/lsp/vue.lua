local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    require("lspconfig")["vuels"].setup({
        cmd = { DATA .. "/mason/bin/vls" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
        filetypes = { "vue" },
        root_dir = require("lspconfig/util").root_pattern("package.json", "vue.config.js"),
        init_options = {
            config = {
                css = {},
                emmet = {},
                html = {
                    suggest = {},
                },
                javascript = {
                    format = {},
                },
                stylusSupremacy = {},
                typescript = {
                    format = {},
                },
                vetur = {
                    completion = {
                        autoImport = false,
                        tagCasing = "kebab",
                        useScaffoldSnippets = false,
                    },
                    format = {
                        defaultFormatter = {
                            js = "none",
                            ts = "none",
                        },
                        defaultFormatterOptions = {},
                        scriptInitialIndent = false,
                        styleInitialIndent = false,
                    },
                    useWorkspaceDependencies = false,
                    validation = {
                        script = true,
                        style = true,
                        template = true,
                    },
                },
            },
        },
    })
end

return M
