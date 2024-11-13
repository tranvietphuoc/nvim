local M = {}

function M.setup()
    local wk = require("which-key")
    local builtin = require("telescope.builtin")

    -- telescope
    wk.add({
        { "<leader>f", group = "File" }, -- group
        {
            "<leader>ff",
            function()
                builtin.find_files({ hidden = true })
            end,
            desc = "Find files",
            mode = "n",
        },
        {
            "<leader>fc",
            function()
                builtin.commands()
            end,
            desc = "Commands list",
            mode = "n",
        },
        {
            "<leader>fb",
            function()
                builtin.buffers()
            end,
            desc = "Find Buffers",
            mode = "n",
        },
        {
            "<leader>fw",
            function()
                builtin.live_grep({ hidden = true })
            end,
            desc = "Find words",
            mode = "n",
        },

        { "<leader>fg", group = "Git" },
        {
            "<leader>fgb",
            function()
                builtin.git_branches()
            end,
            desc = "Git branches",
            mode = "n",
        },
        {
            "<leader>fgs",
            function()
                builtin.git_status()
            end,
            desc = "Git status",
            mode = "n",
        },
        {
            "<leader>fgc",
            function()
                builtin.git_commits()
            end,
            desc = "Git commits",
            mode = "n",
        },

        {
            "<leader>fd",
            function()
                builtin.diagnostics()
            end,
            desc = "Diagnostics list",
            mode = "n",
        },
        {
            "<leader>fq",
            function()
                builtin.quickfix()
            end,
            desc = "Quickfix list",
            mode = "n",
        },
        {
            "<leader>ft",
            function()
                builtin.colorscheme()
            end,
            desc = "Themes list",
            mode = "n",
        },
        {
            "<leader>fs",
            function()
                builtin.command_history()
            end,
            desc = "Command history",
            mode = "n",
        },
    })

    -- nvim tree keymap
    wk.add({
        { "<leader>b", "<cmd>NvimTreeToggle<cr>", desc = "Open NvimTree", mode = "n" },
    })
    wk.add({
        { "<leader>r", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh NvimTree", mode = "n" },
    })

    -- Git
    wk.add({
        { "<leader>G", group = "Git Utilites" },
        { "<leader>GU", "<cmd>lua _G.__fterm_gitui()<cr>", desc = "Open GitUI", mode = "n" },
        { "<leader>GD", "<cmd>GitvDiff<cr>", desc = "Git diff", mode = "n" },
        { "<leader>Gd", "<cmd>diffget //2<cr>", desc = "Git diff split", mode = "n" },
    })

    -- markdow preview
    wk.add({
        { "<leader>M", group = "Markdown Preview" },
        { "<leader>MS", "<cmd>MarkdownPreview<cr>", desc = "Start preview", mode = "n" },
        { "<leader>Ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop preview", mode = "n" },
    })

    -- live server
    wk.add({
        { "<leader>L", group = "Live server" },
        { "<leader>LS", "<cmd>LiveServerStart<cr>", desc = "Start server", mode = "n" },
        { "<leader>Ls", "<cmd>LiveServerStop<cr>", desc = "Stop server", mode = "n" },
    })

    -- find and replace Spectre
    wk.add({
        { "<leader>S", group = "Spectre - Find and replace" },
        {
            "<leader>So",
            "<cmd>lua require('spectre').open()<cr>",
            desc = "Spectre open",
            mode = "n",
        },
        {
            "<leader>SO",
            "<cmd>lua require('spectre').open_visual()<cr>",
            desc = "Spectre open visual",
            mode = "v",
        },
        {
            "<leader>Sw",
            "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
            desc = "Spectre open with selected word",
            mode = "n",
        },
        {
            "gR",
            "<cmd>Trouble lsp_references<cr>",
            desc = "Trouble Lsp references",
            mode = "n",
        },
    })

    -- codelens
    wk.add({
        { "<leader>C", group = "Code lens" },
        { "<leader>CR", "<cmd>lua vim.lsp.codelens.refresh()<cr>", desc = "Refresh codelens", mode = "n" },
        { "<leader>Cr", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Run codelens", mode = "n" },
    })

    -- splitting windows naviagating
    wk.add({
        { "<C-k>", ":wincmd k<CR>", desc = "Moving up", mode = "n" },
        { "<C-j>", ":wincmd j<CR>", desc = "Moving down", mode = "n" },
        { "<C-h>", ":wincmd h<CR>", desc = "Moving left", mode = "n" },
        { "<C-l>", ":wincmd l<CR>", desc = "Moving right", mode = "n" },
    })

    -- Dadbod
    wk.add({
        {
            "<leader>D",
            group = "DatabaseUI",
        },
        {
            "<leader>DB",
            ":DBUIToggle<cr>",
            desc = "Trigger DBUI",
            mode = "n",
        },
        { "<leader>DF", ":DBUIFindBuffer<cr>", desc = "Database find buffer.", mode = "n" },
        { "<leader>DR", ":DBUIRenameBuffer<cr>", desc = "Database rename buffer.", mode = "n" },
        { "<leader>DL", "DBUILastQueryInfo<cr>", desc = "Last query info.", mode = n },
    })

    -- trouble
    wk.add({
        { "<leader>x", group = "Trouble.nvim" },
        { "<leader>xx", "<cmd>Trouble<cr>", desc = "Open trouble", mode = "n" },
        { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace diagnostics", mode = "n" },
        { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Document diagnostics", mode = "n" },
        { "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Loc list", mode = "n" },
        { "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Quickfix", mode = "n" },
    })

    -- move selected lines/block in v mode
    wk.add({
        { "K", ":move '<-2<CR>gv-gv", desc = "Move up", mode = "x" },
        { "J", ":move '>+1<CR>gv-gv", desc = "Mode down", mode = "x" },
    })

    -- zen mode
    wk.add({
        { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Toggle Zen mode", mode = "n" },
    })

    -- lspsaga
    --[[ ["g"] = {
            r = { "<cmd>Lspsaga rename<cr>", "Lspsaga Rename" },
            p = { "<cmd>Lspsaga peek_definition<cr>", "Lspsaga Peek Definition" }
        }, ]]
    -- })
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
