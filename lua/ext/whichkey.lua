local M = {}

function M.setup()
    local wk = require("which-key")
    wk.register({
        ["<leader>"] = {
            f = {
                name = "+file",
                f = { "<cmd>Telescope find_files<cr>", "Find file" },
                g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
                s = { "<cmd>Telescope search_history<cr>", "Search history" },
            },
            b = { "<cmd>NvimTreeToggle<cr>", "Open NvimTree" },
            r = { "<cmd>NvimTreeRefresh<cr>", "Refresh NvimTree" },
            z = { "<cmd>ZenMode<cr>", "Zen Mode" },
            G = {
                name = "+Git",
                U = { "<cmd>lua _G.__fterm_gitui()<cr>", "Open GitUI" },
                d = { "<cmd>Gvdiffsplit<cr>", "GitvDiff" },
            },
            t = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
            m = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
            M = { "<cmd>MarkdownPreviewStop<cr>", "Markdown Preview Stop" },
            l = {
                name = "+live server",
                s = { "<cmd>LiveServer start<cr>", "Start" },
                S = { "<cmd>LiveServer stop<cr>", "Stop" },
            },
            n = { "<cmd>Neogit<cr>", "Neogit" },
        },
    })
    wk.setup({
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 15 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
    })
end

return M
