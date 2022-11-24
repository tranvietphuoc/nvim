local M = {}

function M.setup()
    --[[  require("lspconfig").sqlls.setup({
        cmd = { DATA .. "/mason/bin/sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql" },
        single_file_support = true,
    } ) ]]

    require("lspconfig").sqls.setup({
        cmd = { DATA .. "/mason/bin/sqls", "-config", "~/.config/sql-language-server/.sqlsrc.yml" },
        filetypes = { "sql", "mysql" },
        single_file_support = true,
    })
end

return M
