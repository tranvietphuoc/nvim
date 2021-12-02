local M = {}

function M.setup()
    vim.g.dashboard_custom_header = {
        " ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓",
        " ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
        "▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░",
        "▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ",
        "▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒",
        "░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░",
        "░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░",
        "   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ",
        "         ░    ░  ░    ░ ░        ░   ░         ░   ",
        "                                ░                  ",
    }

    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
        a = { description = { " Open last session                     SPC s l" }, command = "SessionLoad" },
        b = { description = { " Recently opened files                 SPC f h" }, command = "Telescope oldfiles" },
        c = {
            description = { " Find files                            SPC f f" },
            command = "Telescope find_files",
        },
        d = {
            description = { " Find words                            SPC f a" },
            command = "Telescope live_grep",
        },
        e = {
            description = { " New file                              SPC c n" },
            command = ":enew",
        },
        f = {
            description = { " Change colorscheme                    SPC t c" },
            command = "Telescope colorscheme",
        },
        g = {
            description = { " Bookmarks                             SPC f b" },
            command = "Telescope marks",
        },
        h = {
            description = { " Go to configuration                   SPC t n" },
            command = ":e ~/.config/nvim/lua/config/init.lua",
        },
    }
    vim.g.indentLine_fileTypeExclude = { "dashboard" }
    vim.g.indentLine_fileTypeExclude = { "dashboard" }
    vim.g.dashboard_custom_footer = { "Configured by Tran Viet Phuoc" }
    -- vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")
    vim.g.dashboard_preview_file_height = 12
    vim.g.dashboard_preview_file_width = 100
end

return M
