local M = {}

function M.setup()
    require("lspconfig").vuels.setup({
        cmd = { DATA .. "/lsp_servers/vuels/node_modules/.bin/vls" },
        on_attach = require("lsp").common_on_attach,
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
