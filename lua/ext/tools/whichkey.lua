return {
    setup = function()
        local wk = require("which-key")

        wk.setup({
            preset = "modern",
            delay = 300, -- Delay before Which-Key shows up (0.3s)
            win = {
                border = "rounded",
                position = "bottom",
                padding = { 1, 2, 1, 2 },
            },
        })

        wk.add({
            -- Help & Search all mappings
            -- Help & Search all mappings
            { "<leader>?", "<cmd>Telescope keymaps<cr>", desc = "Search Keymaps (Telescope)" },

            -- File & Telescope
            { "<leader>f", group = "Find / File" },
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<leader>fgf", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
            { "<leader>fw", "<cmd>Telescope live_grep hidden=true<cr>", desc = "Find words (grep)" },
            { "<leader>fz", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
            { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
            { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
            { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands list" },
            { "<leader>fr", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
            { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
            { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
            { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics list" },
            { "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix list" },
            { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Themes list" },
            { "<leader>fs", "<cmd>Telescope command_history<cr>", desc = "Command history" },
            { "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
            { "<leader>f?", "<cmd>Telescope search_history<cr>", desc = "Search history" },
            { "<leader>fB", "<cmd>Telescope builtin<cr>", desc = "Telescope built-in pickers" },

            -- Git inside Find group
            { "<leader>fg", group = "Git Pickers" },
            { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
            { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
            { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Git commits (Repository)" },
            { "<leader>fBC", "<cmd>Telescope git_bcommits<cr>", desc = "Git commits (Current Buffer)" },
            { "<leader>fgt", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },

            -- Git group
            { "<leader>g", group = "Git" },
            { "<leader>gd", "<cmd>DiffviewOpen -uno<cr>", desc = "Diff View Open" },
            { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diff View Close" },
            { "<leader>gm", "<cmd>GitMessenger<cr>", desc = "Git Messenger" },
            {
                "<leader>gl",
                function()
                    require("gitgraph").draw({}, { all = true, max_count = 5000 })
                end,
                desc = "GitGraph - Draw",
            },

            -- Buffer / Navigation / Tree
            { "<leader>b", "<cmd>NvimTreeToggle<cr>", desc = "Open NvimTree" },
            { "<leader>r", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh NvimTree" },

            -- Barbar / Buffer navigation (Restored)
            { "<leader>1", "<Cmd>BufferGoto 1<CR>", desc = "Go to Buffer 1" },
            { "<leader>2", "<Cmd>BufferGoto 2<CR>", desc = "Go to Buffer 2" },
            { "<leader>3", "<Cmd>BufferGoto 3<CR>", desc = "Go to Buffer 3" },
            { "<leader>4", "<Cmd>BufferGoto 4<CR>", desc = "Go to Buffer 4" },
            { "<leader>5", "<Cmd>BufferGoto 5<CR>", desc = "Go to Buffer 5" },
            { "<leader>6", "<Cmd>BufferGoto 6<CR>", desc = "Go to Buffer 6" },
            { "<leader>7", "<Cmd>BufferGoto 7<CR>", desc = "Go to Buffer 7" },
            { "<leader>8", "<Cmd>BufferGoto 8<CR>", desc = "Go to Buffer 8" },
            { "<leader>9", "<Cmd>BufferGoto 9<CR>", desc = "Go to Buffer 9" },
            { "<leader>0", "<Cmd>BufferLast<CR>", desc = "Go to Last Buffer" },

            -- Markdown
            { "<leader>M", group = "Markdown Preview" },
            { "<leader>MS", "<cmd>MarkdownPreview<cr>", desc = "Start preview" },
            { "<leader>Ms", "<cmd>MarkdownPreviewStop<cr>", desc = "Stop preview" },

            -- Live server
            { "<leader>L", group = "Live server" },
            { "<leader>LS", "<cmd>LiveServerStart<cr>", desc = "Start server" },
            { "<leader>Ls", "<cmd>LiveServerStop<cr>", desc = "Stop server" },

            -- Spectre
            { "<leader>S", group = "Spectre" },
            { "<leader>So", "<cmd>lua require('spectre').open()<cr>", desc = "Spectre open" },
            { "<leader>SO", "<cmd>lua require('spectre').open_visual()<cr>", desc = "Spectre open visual", mode = "v" },
            { "<leader>Sw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Spectre open word" },

            -- Code lens
            { "<leader>C", group = "Code lens" },
            { "<leader>CR", "<cmd>lua vim.lsp.codelens.refresh()<cr>", desc = "Refresh codelens" },
            { "<leader>Cr", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "Run codelens" },

            -- Database
            { "<leader>D", group = "DatabaseUI" },
            { "<leader>DB", ":DBUIToggle<cr>", desc = "Trigger DBUI" },
            { "<leader>DF", ":DBUIFindBuffer<cr>", desc = "Database find buffer." },
            { "<leader>DR", ":DBUIRenameBuffer<cr>", desc = "Database rename buffer." },
            { "<leader>DL", ":DBUILastQueryInfo<cr>", desc = "Last query info." },

            -- Trouble
            { "<leader>x", group = "Trouble" },
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Open trouble" },
            { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
            { "<leader>xd", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
            { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Loc list" },
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix" },

            -- LSP Search (using Telescope)
            { "<leader>l", group = "LSP Search" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
            { "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
            { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
            { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
            { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },

            -- Other mappings
            { "gR", "<cmd>Trouble lsp_references toggle focus=false<cr>", desc = "Lsp references" },
            { "<leader>Z", "<cmd>ZenMode<cr>", desc = "Toggle Zen mode" },

            -- Global Shortcuts
            { "<Tab>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
            { "<S-Tab>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
            { "<S-c>", "<Cmd>BufferClose<CR>", desc = "Close Buffer" },
            { "<S-p>", "<Cmd>BufferPin<CR>", desc = "Pin Buffer" },

            -- Window navigation
            { "<C-k>", ":wincmd k<CR>", desc = "Move Up" },
            { "<C-j>", ":wincmd j<CR>", desc = "Move Down" },
            { "<C-h>", ":wincmd h<CR>", desc = "Move Left" },
            { "<C-l>", ":wincmd l<CR>", desc = "Move Right" },

            -- Visual mode move lines
            { "K", ":move '<-2<CR>gv-gv", desc = "Move Lines Up", mode = "x" },
            { "J", ":move '>+1<CR>gv-gv", desc = "Move Lines Down", mode = "x" },
        })
    end,
}
