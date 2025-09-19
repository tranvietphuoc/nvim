local M = {}

local root_pattern = require("lspconfig").util.root_pattern
function M.setup()
    vim.lsp.config("r_language_server", {
        cmd = { "R", "--slave", "-e", "languageserver::run()" },
        log_level = 2,
        file_type = { "r" },
        root_dir = root_pattern(".git"),
    })
    vim.lsp.enable("r_language_server")
end

return M
