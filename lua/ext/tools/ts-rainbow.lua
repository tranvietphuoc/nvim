local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
            -- Highlight the entire buffer all at once
        },
    })
end

return M
