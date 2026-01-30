return {
    setup = function()
        require("nvim-tree").setup({
            disable_netrw = false,
            hijack_netrw = true,
            auto_reload_on_write = true,
            sort_by = "name",
            update_focused_file = {
                enable = false,
                update_cwd = false,
                ignore_list = {},
            },
            renderer = {
                indent_markers = { enable = false },
                icons = { webdev_colors = true },
            },
            hijack_directories = {
                enable = true,
                auto_open = true,
            },
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
                custom = {
                    "^.venv$",
                    "^node_modules$",
                    "^.pytest_cache$",
                    "^__pycache__$",
                    "^.git$",
                    "^.github$",
                    "^.mypy_cache$",
                    "^.ipynb_checkpoints$",
                    "^.cache$",
                    "^target$",
                    "^.metals$",
                },
            },
            git = {
                enable = true,
                ignore = false, -- display files/folders that are  listed in .gitignore
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
                types = {},
            },
        })
    end,
}
