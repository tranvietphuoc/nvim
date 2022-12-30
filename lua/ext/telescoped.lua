local M = {}

function M.setup()
    local command_center = require("command_center")
    local telescope = require("telescope")
    local noremap = { noremap = true, silent = true }

    command_center.add({
        {
            desc = "Open command_center",
            cmd = "<CMD>Telescope command_center<CR>",
            keys = {
                { "n", "<Leader>fc", noremap },
            },
        },
        {
            desc = "vertical split",
            cmd = ":vsplit<cr>",
            keys = {
                { "n", "<leader>|", noremap },
            },
        },
        {
            desc = "horizontal split",
            cmd = ":split<cr>",
            keys = {
                { "n", "<leader>-", noremap },
            },
        },
    }, command_center.mode.REGISTER_ONLY)

    telescope.setup({
        defaults = {
            file_ignore_patterns = {
                "node_modules",
                "__pycache__",
                "target",
                ".venv",
                ".git",
                ".mypy_cache",
            },

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
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
            command_center = {
                components = {
                    command_center.component.DESC,
                    command_center.component.KEYS,
                },
                sort_by = {
                    command_center.component.DESC,
                    command_center.component.KEYS,
                },
                auto_replace_desc_with_cmd = false,
            },
        },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("command_center")
end

return M
