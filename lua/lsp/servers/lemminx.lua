local M = {}

function M.setup()
    vim.lsp.config("lemminx", {
        cmd = { DATA .. "/mason/bin/lemminx" },
        filetypes = { "xml" },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git", "." }, { upward = true })[1]),
        single_file_support = true,
    })
    vim.lsp.enable("lemminx")
end

return M
