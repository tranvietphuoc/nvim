local M = {}

function M.setup()
    --[[     lspconfig.sqlls.setup {
        cmd = {
            DATA .. "/mason/bin/sql-language-server",
            "up",
            "--method",
            "stdio",
            -- "-config",
            -- "~/.config/nvim/sql-language-server/.sqllsrc.json",
        },
        root_dir = util.root_pattern(),
        filetypes = { "sql" },
        single_file_support = true,
    } ]]

    --[[ -- postgres_lsp
    -- need to install postgres_lsp first follow this link: https://github.com/supabase/postgres_lsp
    require("lspconfig").postgres_lsp.setup {
        cmd = { "postgres_lsp" },
        filetype = { "sql" },
        root_dir = util.root_pattern(),
        single_file_support = true,
    } ]]

    --[[ lspconfig.sqls.setup {
        cmd = { DATA .. "/mason/bin/sqls", "-config", "~/.config/nvim/sqls/config.yml" },
        single_file_support = true,
        filetypes = { "sql" },
        root_dir = util.root_pattern(),
    } ]]
end

return M
