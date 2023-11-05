local M = {}

function M.setup()
    require("neogit").setup({
        auto_show_console = false,
        integrations = {
            diffview = true,
        },
    })
end

return M
