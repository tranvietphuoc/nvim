local M = {}
local utils = require("lspconfig.util")

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.texlab.setup({
        cmd = { DATA .. "/mason/bin/texlab" },
        filetypes = { "tex", "bib", "plaintex", "markdown", "rst" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
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
end

return M
