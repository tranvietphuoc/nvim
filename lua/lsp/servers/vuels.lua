local M = {}

function M.setup()
    vim.lsp.config("vuels", {
        cmd = { DATA .. "/mason/bin/vls" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "vue" },
        root_dir = vim.fs.dirname(vim.fs.find({ "package.json", "vue.config.js" }, { upward = true })[1]),
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
    vim.lsp.enable("vuels")
end

return M
