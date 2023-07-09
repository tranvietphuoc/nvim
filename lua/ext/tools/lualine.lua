-- copy and custom from evil_lualine by shadmansaleh

local M = {}

function M.setup()
    -- local colors = require("nightfox.palette.nordfox").palette
    local colors = require("tokyonight.colors").setup({ transform = true })

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
                normal = { c = { fg = colors.fg, bg = colors.fg_gutter } },
                inactive = { c = { fg = colors.fg, bg = colors.fg_gutter } },
            },
        },
        sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            -- These will be filled later
            lualine_c = {},
            lualine_x = {},
        },
        inactive_sections = {
            -- these are to remove the defaults
            lualine_a = {},
            lualine_b = {},
            lualine_y = {},
            lualine_z = {},
            lualine_c = {},
            lualine_x = {},
        },
    }

    -- Inserts a component in lualine_c at left section
    local function append_left(component)
        table.insert(configs.sections.lualine_c, component)
    end

    -- Inserts a component in lualine_x ot right section
    local function append_right(component)
        table.insert(configs.sections.lualine_x, component)
    end

    append_left({
        function()
            return "▊"
        end,
        color = { fg = colors.fg }, -- Sets highlighting of component
        padding = { left = 0, right = 1 }, -- We don't need space before this
    })

    append_left({
        -- mode component
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
                [""] = "VISUAL-BLOCK",
                v = "VISUAL",
                r = "HIT-ENTER",
                rm = "--MORE",
                ["!"] = "SHELL",
                R = "REPLACE",
                Rv = "VIRTUAL-REPLACE",
                s = "SELECT",
                S = "SELECT-LINE",
                [""] = "SELECT-BLOCK",
                t = "TERMINAL",
                ["r?"] = ":CONFIRM",
            }
            -- auto change color according to neovims mode
            local mode_color = {
                n = colors.cyan,
                i = colors.green,
                v = colors.purple,
                [""] = colors.purple,
                V = colors.purple,
                c = colors.orange,
                no = colors.red,
                s = colors.yellow,
                S = colors.yellow,
                [""] = colors.yellow,
                ic = colors.green1,
                R = colors.green2,
                Rv = colors.green2,
                ["r?"] = colors.yellow,
                cv = colors.yellow,
                ce = colors.yellow,
                r = colors.blue3,
                rm = colors.blue3,
                ["!"] = colors.red,
                t = colors.red,
            }
            vim.api.nvim_command("hi! LualineMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.fg_gutter)
            return alias[vim.fn.mode()]
        end,
        color = "LualineMode",
        padding = { right = 1 },
    })

    append_left({
        "branch",
        icon = "",
        color = { fg = colors.bright_blue, gui = "bold" },
    })

    append_left({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "柳 ", removed = " " },
        diff_color = {
            added = { fg = colors.git.add },
            modified = { fg = colors.git.change },
            removed = { fg = colors.git.delete },
        },
        cond = conditions.hide_in_width,
    })

    append_left({
        -- filesize component
        "filesize",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.comment, gui = "bold" },
    })

    append_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.green, gui = "bold" },
    })
    append_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.blue },
            color_hint = { fg = colors.blue },
        },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    append_left({
        function()
            return "%="
        end,
    })

    append_left({
        -- Lsp server name .
        function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()
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
        icon = "",
        color = { fg = colors.cyan, gui = "bold" },
    })

    -- add components to right section
    append_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = false,
        color = { fg = colors.orange, gui = "bold" },
    })

    append_right({
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.orange, gui = "bold" },
    })

    append_right({
        "filetype",
        cond = conditions.buffer_not_empty,
        fmt = string.upper,
        icons_enabled = false,
        color = { fg = colors.orange, gui = "bold" },
    })

    append_right({
        "location",
        color = { fg = colors.fg, gui = "bold" },
    })

    append_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

    append_right({
        function()
            return "▊"
        end,
        color = { fg = colors.fg },
        padding = { left = 1 },
    })

    require("lualine").setup(configs)
end

return M
