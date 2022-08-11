local M = {}

function M.setup()
    require("lspconfig").sqls.setup({
        cmd = { DATA .. "/lsp_servers/sqls/sqls", "-config", "./config.yml" },
        filetypes = { "sql" },
        single_file_support = true,
    })
end

return M
