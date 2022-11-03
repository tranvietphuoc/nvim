-- copy and custom from evil_lualine by shadmansaleh

local M = {}

function M.setup()
    local colors = require("tokyonight.colors").default

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
                normal = { c = { fg = colors.fg, bg = colors.bg_highlight } },
                inactive = { c = { fg = colors.fg, bg = colors.bg_highlight } },
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
        color = { fg = colors.purple }, -- Sets highlighting of component
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
                n = colors.blue,
                i = colors.green,
                v = colors.magenta,
                [""] = colors.magenta,
                V = colors.magenta,
                c = colors.yellow,
                no = colors.red,
                s = colors.orange,
                S = colors.orange,
                [""] = colors.orange,
                ic = colors.yellow,
                R = colors.blue5,
                Rv = colors.blue5,
                ["r?"] = colors.blue5,
                cv = colors.yellow,
                ce = colors.yellow,
                r = colors.blue6,
                rm = colors.blue6,
                -- ["r?"] = colors.green1,
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
        icon = "",
        color = { fg = colors.blue6, gui = "bold" },
    })

    append_left({
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "柳 ", removed = " " },
        diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
    })

    append_left({
        -- filesize component
        "filesize",
        cond = conditions.buffer_not_empty,
    })

    append_left({
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.green1, gui = "bold" },
    })
    append_left({
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
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
        icon = " LSP:",
        color = { fg = colors.fg, gui = "bold" },
    })

    -- add components to right section
    append_right({
        "fileformat",
        fmt = string.upper,
        icons_enabled = false,
        color = { fg = colors.green, gui = "bold" },
    })

    append_right({
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = "bold" },
    })

    append_right({
        "filetype",
        cond = conditions.buffer_not_empty,
        fmt = string.upper,
        icons_enabled = false,
        color = { fg = colors.green, gui = "bold" },
    })

    append_right({ "location" })

    append_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

    append_right({
        function()
            return "▊"
        end,
        color = { fg = colors.purple },
        padding = { left = 1 },
    })

    require("lualine").setup(configs)
end

return M
