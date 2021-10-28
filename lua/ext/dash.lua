local M = {}

function M.setup()
    vim.g.dashboard_custom_header = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    vim.g.dashboard_default_executive = "Telescope"

    vim.g.dashboard_custom_section = {
        a = { description = { "  Find file           " }, command = "Telescope find_files" },
        b = { description = { "  Recently used files " }, command = "Telescope oldfiles" },
        c = { description = { "  Load last session   " }, command = "SessionLoad" },
        d = { description = { "  Find word           " }, command = "Telescope live_grep" },
        e = { description = { "  Settings            " }, command = ":e ~/.config/nvim/lua/config/init.lua" },
    }
    vim.g.indentLine_fileTypeExclude = { "dashboard" }
    vim.g.indentLine_fileTypeExclude = { "dashboard" }
    vim.g.dashboard_custom_footer = { "Configured by Tran Viet Phuoc" }
    -- vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")
    vim.g.dashboard_preview_file_height = 12
    vim.g.dashboard_preview_file_width = 100
end

return M
