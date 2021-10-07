local M = {}

function M.setup()
    require("ext.db-completion").setup()

    require("ext.git-ui").setup()
    require("ext.telescope").setup()
    require("ext.whichkey").setup()
    require("ext.galaxy-line").setup()
    require("ext.tagbar").setup()
    require("ext.autopairs").setup()
    require("ext.barbar").setup()
    require("ext.doge").setup()
end

return M
