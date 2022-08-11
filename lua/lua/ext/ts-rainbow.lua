local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = 1000,
        },
    })
end

return M
