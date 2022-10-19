local M = {}

function M.setup()
    local db = require("dashboard")
    local home = os.getenv("HOME")

    db.custom_header = {
        "   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ",
        " ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ",
        " ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ",
        " ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ",
        " ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ",
        " ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ",
        " ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ",
        " ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ",
        " ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ",
        " ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ",
        "",
        "            N E O V I M            ",
    }

    db.preview_command = "bat"
    db.preview_file_width = 70
    db.preview_file_height = 11
    db.preview_file_path = home .. "/.config/nvim/init.lua"
    db.custom_center = {
        {
            icon = "   ",
            desc = "Recently latest session                  ",
            shortcut = "SPC s l",
            action = "SessionLoad",
        },
        {
            icon = "  ",
            desc = "Recently opened files                   ",
            action = "DashboardFindHistory",
            shortcut = "SPC f h",
        },
        {
            icon = "  ",
            desc = "Find  File                              ",
            action = "Telescope find_files find_command=rg,--hidden,--files",
            shortcut = "SPC f f",
        },
        {
            icon = "  ",
            desc = "File Browser                            ",
            action = "Telescope file_browser",
            shortcut = "SPC f b",
        },
        {
            icon = "  ",
            desc = "Find  word                              ",
            action = "Telescope live_grep",
            shortcut = "SPC f w",
        },
        {
            icon = "  ",
            desc = "Open Personal dotfiles                  ",
            action = "Telescope dotfiles path=" .. home .. "/.config/nvim/init.lua",
            shortcut = "SPC f d",
        },
    }

    db.custom_footer = { "Configured by Tran Viet Phuoc" }
end

return M
