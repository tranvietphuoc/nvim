local M = {}

function M.setup()
    -- following options are the default
    require("nvim-tree").setup({

        -- disables netrw completely
        disable_netrw = false,

        auto_reload_on_write = true,
        -- hijack netrw window on startup
        hijack_netrw = true,

        hijack_unnamed_buffer_when_opening = false,

        -- will not open on setup if the filetype is in this list
        -- ignore_ft_on_setup = { "dashboard" },

        -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = false,

        sort_by = "name",
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = false,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = false,
        -- show lsp diagnostics in the signcolumn
        -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
        update_focused_file = {
            -- enables the feature
            enable = false,
            -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
            -- only relevant when `update_focused_file.enable` is true
            update_cwd = false,
            -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
            -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
            ignore_list = { ".venv", "node_modules", ".pytest_cache", ".git", "target", "__pycache__" },
        },

        renderer = {
            indent_markers = {
                enable = false,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
            },
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        --[[  update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        }, ]]
        system_open = {
            cmd = "",
            args = {},
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
            icons = {
                hint = "",
                info = "",
                warning = "",
                error = "",
            },
        },
        filters = {
            dotfiles = false,
            --[[ custom = {
                ".metals",
                ".venv",
                ".mypy_cache",
                ".pytest_cache",
                "__pycache__",
                "node_modules",
                ".git",
                ".github",
                ".ipynb_checkpoints",
                ".cache",
                "target",
            }, ]]
            exclude = {},
        },

        git = {
            enable = true,
            ignore = true,
            timeout = 400,
        },
        actions = {
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
            },
            open_file = {
                quit_on_open = false,
                resize_window = false,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            },
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                diagnostics = false,
                git = false,
                profile = false,
            },
        },
    })
end

return M
