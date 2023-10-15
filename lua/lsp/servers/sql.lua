local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

function M.setup()
    --[[  require("lspconfig").sqlls.setup({
        cmd = { DATA .. "/mason/bin/sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql" },
        single_file_support = true,
    } ) ]]
    require("lspconfig").sqlls.setup({
        cmd = {
            DATA .. "/mason/bin/sql-language-server",
            "up",
            "--method",
            "stdio",
            -- "-config",
            -- "~/.config/sql-language-server/.sqllsrc.json",
        },
        flags = lsp_flags,
        -- root_dir = {},
        filetypes = { "sql" },
        single_file_support = true,
    })
end

return M
