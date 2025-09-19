local M = {}
local utils = require("lspconfig.util")

function M.setup()
    vim.lsp.config("texlab", {
        cmd = { DATA .. "/mason/bin/texlab" },
        filetypes = { "tex", "bib", "plaintex", "markdown", "rst" },
        on_attach = require("lsp").common_on_attach,
        settings = {
            texlab = {
                auxDirectory = ".",
                bibtexFormatter = "texlab",
                build = {
                    args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                    executable = "latexmk",
                    forwardSearchAfter = false,
                    onSave = false,
                },
                chktex = {
                    onEdit = false,
                    onOpenAndSave = false,
                },
                diagnosticsDelay = 300,
                formatterLineLength = 80,
                forwardSearch = {
                    args = {},
                },
                latexFormatter = "latexindent",
                latexindent = {
                    modifyLineBreaks = false,
                },
            },
        },
        single_file_support = true,
        root_dir = function(fname)
            return utils.root_pattern(".latexmkrc")(fname) or utils.find_git_ancestor(fname)
        end,
    })

    vim.lsp.enable("textlab")
end

return M
