local capabilities = require("lsp").capabilities()

local function setup()
    vim.g.tagalong_verbose = 1
    --
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    vim.lsp.config("emmet_ls", {
        cmd = { DATA .. "/mason/bin/emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascriptreact", "typescriptreact", "sass", "scss", "xml", "htmldjango" },
        init_options = {
            html = {
                options = {
                    ["bem.enable"] = false,
                },
            },
        },
        capabilities = capabilities,
        -- root_dir = vim.fs.dirname(vim.fs.find({ ".git", "package.json" }, { upward = true })[1]),
    })

    vim.lsp.enable("emmet_ls")
end

return {
    setup = setup,
}
