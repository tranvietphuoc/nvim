return {
    setup = function()
        local colors = require("tokyonight.colors").setup({ style = "day" })

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        local configs = {
            options = {
                component_separators = "",
                section_separators = "",
                theme = {
                    normal = { c = { fg = colors.comment, bg = colors.bg_highlight } },
                    inactive = { c = { fg = colors.comment, bg = colors.bg_highlight } },
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_y = {},
                lualine_z = {},
                lualine_c = {},
                lualine_x = {},
            },
        }

        local function append_left(component)
            table.insert(configs.sections.lualine_c, component)
        end

        local function append_right(component)
            table.insert(configs.sections.lualine_x, component)
        end

        append_left({
            function()
                return "▊"
            end,
            color = { fg = colors.comment },
            padding = { left = 0, right = 1 },
        })

        append_left({
            function()
                local alias = {
                    n = "NORMAL",
                    no = "OPERATOR-PENDING",
                    i = "INSERT",
                    ic = "INSERT-COMPLETION",
                    c = "COMMAND",
                    cv = "VIM-EX",
                    ce = "NORMAL-EX",
                    V = "VISUAL-LINE",
                    [" "] = "VISUAL-BLOCK",
                    v = "VISUAL",
                    r = "HIT-ENTER",
                    rm = "--MORE",
                    ["!"] = "SHELL",
                    R = "REPLACE",
                    Rv = "VIRTUAL-REPLACE",
                    s = "SELECT",
                    S = "SELECT-LINE",
                    [" "] = "SELECT-BLOCK",
                    t = "TERMINAL",
                    ["r?"] = ":CONFIRM",
                }
                local mode_color = {
                    n = colors.blue,
                    i = colors.green,
                    v = colors.magenta,
                    [" "] = colors.magenta,
                    V = colors.magenta,
                    c = colors.yellow,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [" "] = colors.yellow,
                    ic = colors.cyan,
                    R = colors.red,
                    Rv = colors.red,
                    ["r?"] = colors.yellow,
                    cv = colors.yellow,
                    ce = colors.yellow,
                    r = colors.red,
                    rm = colors.red,
                    ["!"] = colors.red,
                    t = colors.red,
                }
                vim.api.nvim_command(
                    "hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg_highlight
                )
                return alias[vim.fn.mode()]
            end,
            color = "LualineMode",
            padding = { right = 1 },
        })

        append_left({
            "branch",
            icon = "",
            color = { fg = colors.green, gui = "bold" },
        })

        append_left({
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.yellow },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        })

        append_left({
            "filesize",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.fg, gui = "bold" },
        })

        append_left({
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.fg, gui = "bold" },
        })

        append_left({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
                color_hint = { fg = colors.blue },
            },
        })

        append_left({
            function()
                return "%="
            end,
        })

        append_left({
            function()
                local msg = "null"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " ",
            color = { fg = colors.blue, gui = "bold" },
        })

        append_right({
            "fileformat",
            icons_enabled = false,
            color = { fg = colors.comment, gui = "bold" },
        })

        append_right({
            "o:encoding",
            cond = conditions.hide_in_width,
            color = { fg = colors.comment, gui = "bold" },
        })

        append_right({
            "filetype",
            cond = conditions.buffer_not_empty,
            icons_enabled = false,
            color = { fg = colors.comment, gui = "bold" },
        })

        append_right({
            "location",
            color = { fg = colors.comment, gui = "bold" },
        })

        append_right({
            "progress",
            color = { fg = colors.comment, gui = "bold" },
        })

        append_right({
            function()
                return "▊"
            end,
            color = { fg = colors.comment },
            padding = { left = 0, right = 0 },
        })

        require("lualine").setup(configs)
    end,
}
