local M = {}

local util = require("lspconfig.util")
local lspconfig = require("lspconfig")

function M.setup()
    --[[  require("lspconfig").sqlls.setup({
        cmd = { DATA .. "/mason/bin/sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql" },
        single_file_support = true,
    } ) ]]
    lspconfig.sqlls.setup {
        cmd = {
            DATA .. "/mason/bin/sql-language-server",
            "up",
            "--method",
            "stdio",
            -- "-config",
            -- "~/.config/sql-language-server/.sqllsrc.json",
        },
        -- root_dir = {},
        filetypes = { "sql" },
        single_file_support = true,
    }

    --[[ -- postgres_lsp
    -- need to install postgres_lsp first follow this link: https://github.com/supabase/postgres_lsp
    require("lspconfig").postgres_lsp.setup {
        cmd = { "postgres_lsp" },
        filetype = { "sql" },
        root_dir = util.root_pattern(),
        single_file_support = true,
    } ]]
end

return M
