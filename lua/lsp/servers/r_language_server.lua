local M = {}

function M.setup()
    vim.lsp.config("r_language_server", {
        cmd = { "R", "--slave", "-e", "languageserver::run()" },
        log_level = 2,
        file_type = { "r" },
        root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
    })
    vim.lsp.enable("r_language_server")
end

return M
