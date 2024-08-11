local M = {}

function M.setup()
    local wk = require("which-key")
    local builtin = require("telescope.builtin")

    -- telescope
    wk.add({
        { "<leader>f",  group = "File" }, -- group
        { "<leader>ff", "<cmd>Telescope find_files<cr>",     desc = "Find files",     mode = "n" },
        { "<leader>fc", "<cmd>Telescope commands<cr>",       desc = "Commands",       mode = "n" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>",        desc = "Buffers",        mode = "n" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>",      desc = "Live grep",      mode = "n" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>",    desc = "Diagnostics",    mode = "n" },
        { "<leader>fq", "<cmd>Telescope quickfix<cr>",       desc = "Quickfix",       mode = "n" },
        { "<leader>ft", "<cmd>Telescope colorscheme<cr>",    desc = "Themes",         mode = "n" },
        { "<leader>fs", "<cmd>Telescope search_history<cr>", desc = "Search history", mode = "n" },

    })

    -- nvim tree keymap
    wk.add({
        { "<leader>b", "<cmd>NvimTreeToggle<cr>", desc = "Open NvimTree", mode = "n" },
    })
    wk.add({
        { "<leader>r", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh NvimTree", mode = "n" }
    })


    -- Git
    wk.add({
        { "<leader>G",  group = "Git Utilites" },
        { "<leader>GU", "<cmd>lua _G.__fterm_gitui()<cr>", desc = "Open GitUI",     mode = "n" },
        { "<leader>GD", "<cmd>GitvDiff<cr>",               desc = "Git diff",       mode = "n" },
        { "<leader>Gd", "<cmd>diffget //2<cr>",            desc = "Git diff split", mode = "n" },

    })

    -- markdow preview
    wk.add({
        { "<leader>M",  group = "Markdown Preview" },
        { "<leader>MS", "<cmd>MarkdownPreview<cr>",     desc = "Start preview", mode = "n" },
        { "<leader>Ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop preview",  mode = "n" },
    })

    -- live server
    wk.add({
        { "<leader>L",  group = "Live server" },
        { "<leader>LS", "<cmd>LiveServerStart<cr>", desc = "Start server", mode = "n" },
        { "<leader>Ls", "<cmd>LiveServerStop<cr>",  desc = "Stop server",  mode = "n" },
    })

    -- find and replace Spectre
    wk.add({
        { "<leader>s",  group = "Spectre - Find and replace" },
        { "<leader>so", "<cmd>lua require('spectre').open()<cr>",                          desc = "Spectre open",                    mode = "n" },
        { "<leader>sO", "<cmd>lua require('spectre').open_visual()<cr>",                   desc = "Spectre open visual",             mode = "v" },
        { "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Spectre open with selected word", mode = "n" },
        { "gR",         "<cmd>Trouble lsp_references<cr>",                                 desc = "Trouble Lsp references",          mode = "n" }

    })

    -- codelens
    wk.add({
        { "<leader>l",    group = "Code lens" },
        { "<leader>lcld", "<cmd>lua vim.lsp.codelens.refresh()<cr>", desc = "Refresh codelens", mode = "n" },
        { "<leader>lclr", "<cmd>lua vim.lsp.codelens.run()<cr>",     desc = "Run codelens",     mode = "n" },

    })


    -- splitting windows naviagating
    wk.add({
        { "<C-k>", ":wincmd k<CR>", desc = "Moving up",    mode = "n" },
        { "<C-j>", ":wincmd j<CR>", desc = "Moving down",  mode = "n" },
        { "<C-h>", ":wincmd h<CR>", desc = "Moving left",  mode = "n" },
        { "<C-l>", ":wincmd l<CR>", desc = "Moving right", mode = "n" },

    })

    -- trouble
    wk.add {
        { "<leader>x",  group = "Trouble.nvim" },
        { "<leader>xx", "<cmd>Trouble<cr>",                       desc = "Open trouble",          mode = "n" },
        { "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace diagnostics", mode = "n" },
        { "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",  desc = "Document diagnostics",  mode = "n" },
        { "<leader>xl", "<cmd>Trouble loclist<cr>",               desc = "Loc list",              mode = "n" },
        { "<leader>xq", "<cmd>Trouble quickfix<cr>",              desc = "Quickfix",              mode = "n" },

    }

    -- move selected lines/block in v mode
    wk.add({
        { "K", ":move '<-2<CR>gv-gv", desc = "Move up",   mode = "x" },
        { "J", ":move '>+1<CR>gv-gv", desc = "Mode down", mode = "x" },

    })

    -- zen mode
    wk.add({
        { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen mode", mode = "n" },
    })

    -- lspsaga
    --[[ ["g"] = {
            r = { "<cmd>Lspsaga rename<cr>", "Lspsaga Rename" },
            p = { "<cmd>Lspsaga peek_definition<cr>", "Lspsaga Peek Definition" }
        }, ]]
    -- })
    wk.setup({
        window = {
            border = "none",          -- none, single, double, shadow
            position = "bottom",      -- bottom, top
            margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 15 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3,                    -- spacing between columns
            align = "left",                 -- align columns left, center or right
        },
    })
end

return M
