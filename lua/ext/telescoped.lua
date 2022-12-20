local M = {}

function M.setup()
    require("telescope").setup({
        defaults = {
            layout_config = {
                vertical = { width = 0.5 },
            },
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                },
            },
        },
        pickers = {
            find_files = {
                theme = "ivy",
            },
            live_grep = {
                theme = "ivy",
            },
            buffers = {
                theme = "ivy",
            },
            command_history = {
                theme = "ivy",
            },
            search_history = {
                theme = "ivy",
            },
            quickfix = {
                theme = "ivy",
            },
        },
    })
end

return M
