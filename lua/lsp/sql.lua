local M = {}

function M.setup()
    require("lspconfig").sqls.setup({
        cmd = { DATA .. "/mason/bin/sqls", "-config", "./sqlrc.yml" },
        filetypes = { "sql" },
        single_file_support = true,
    })
end

return M
