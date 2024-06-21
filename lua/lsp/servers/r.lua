local M = {}


function M.setup()
    require 'lspconfig'.r_language_server.setup {
        cmd = { "R", "--slave", "-e", "languageserver::run()" },
        log_level = 2,
        file_type = { "r" },
        root_dir = require 'lspconfig.util'.root_pattern('.git')
    }
end

return M
