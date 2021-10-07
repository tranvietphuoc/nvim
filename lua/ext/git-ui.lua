local M = {}

function M.setup()
    local term = require("FTerm.terminal")

    local gitui = term:new():setup({
        cmd = "gitui",
        dimension = {
            height = 0.9,
            width = 0.9,
        },
    })

    -- Use this to toggel gitui in a floating terminal
    --
    function _G.__fterm_gitui()
        gitui:toggle()
    end
end

return M
