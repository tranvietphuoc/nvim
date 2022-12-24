local M = {}

function M.setup()
    require("ext.db-completion").setup()

    require("ext.git-ui").setup()
    -- require("ext.telescope").setup()
    require("ext.whichkey").setup()
    require("ext.lualine").setup()
    require("ext.tagbar").setup()
    require("ext.autopairs").setup()
    -- require("ext.barbar").setup()
    require("ext.doge").setup()
    require("ext.telescoped").setup()
end

return M
