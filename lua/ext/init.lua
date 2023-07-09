local M = {}

function M.setup()
    require("ext.tools.db-completion").setup()

    require("ext.tools.git-ui").setup()
    require("ext.tools.whichkey").setup()
    require("ext.tools.lualine").setup()
    require("ext.tools.autopairs").setup()
    -- require("ext.barbar").setup()
    require("ext.tools.doge").setup()
    require("ext.tools.telescoped").setup()
    require("ext.tools.indent-blankline").setup()
end

return M
