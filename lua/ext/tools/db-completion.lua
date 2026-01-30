return {
    setup = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "sql",
            callback = function()
                vim.bo.omnifunc = "vim_dadbod_completion#omni"
            end,
        })
        vim.g.db_ui_save_location = "$HOME/.config/nvim/db/"
        vim.g.db_ui_auto_execute_table_helpers = 1

        vim.g.dbs = {
            { name = "test", url = "postgres://postgres:mypassword@localhost:5432/test" },
            { name = "wp",   url = "mysql://root@localhost/wp_awesome" },
        }
        vim.g.db_ui_icons = {
            expanded = "+",
            collapsed = "-",
            connection_error = "ﰸ",
            tables = "離",
            new_query = "",
            saved_query = "ﴖ",
            buffers = "﬘",
        }
    end,
}
