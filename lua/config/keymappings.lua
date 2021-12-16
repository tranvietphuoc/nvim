local M = {}

local opts = { noremap = true, silent = true }
function M.setup()
    local map = vim.api.nvim_set_keymap

    vim.g.mapleader = "," -- global leader key

    --split view
    map("n", "<leader>|", ":vsplit<CR>", opts)
    map("n", "<leader>-", ":split<CR>", opts)

    -- saving
    map("n", "<Leader>w", ":w<CR>", opts)

    -- fast quitting
    map("n", "<Leader>q", ":q<CR>", opts)

    -- toggle zen mode
    map("n", "<Leader>z", ":ZenMode<CR>", opts)

    -- toggle gitui
    map("n", "<Leader>G", "<CMD>lua _G.__fterm_gitui()<CR>", opts)
    map("t", "<Leader>G", "<CMD>lua _G.__fterm_gitui()<CR>", opts)

    -- comment toggle
    map("n", "<Leader>/", ":CommentToggle<CR>", opts)
    map("x", "<Leader>/", ":CommentToggle<CR>", opts)
    map("v", "<Leader>/", ":CommentToggle<CR>", opts)

    -- navigating
    --- move between splitted windows
    map("n", "<C-k>", ":wincmd k<CR>", opts)
    map("n", "<C-j>", ":wincmd j<CR>", opts)
    map("n", "<C-h>", ":wincmd h<CR>", opts)
    map("n", "<C-l>", ":wincmd l<CR>", opts)

    -- move selected line / blocks of text in V-mode
    -- Move selected line / block of text in visual mode
    map("x", "K", ":move '<-2<CR>gv-gv", opts)
    map("x", "J", ":move '>+1<CR>gv-gv", opts)

    -- live server
    map("n", "<Leader>l", ":Bracey<CR>", { noremap = true, silent = false })
    map("n", "<Leader>L", ":BraceyStop<CR>", { noremap = true, silent = false })

    -- markdown preview
    map("n", "<Leader>m", "<Plug>MarkdownPreview<CR>", { noremap = false, silent = false })
    map("n", "<Leader>M", "<Plug>MarkdownPreviewStop<CR>", { noremap = false, silent = false })

    -- nvimtree
    map("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)
    map("n", "<Leader>R", ":NvimTreeRefresh<CR>", opts)

    -- telescope
    map("n", "<Leader>f", "<cmd>Telescope find_files<cr>", opts)
    map("n", "<Leader>F", "<cmd>Telescope live_grep<cr>", opts)

    -- map debugger in nvim-dap
    map("n", "<leader>vc", ":lua require('telescope').extensions.vimspector.configurations()<CR>", opts)
    map("n", "<leader>vl", ":call vimspector#Launch()<CR>", opts)
    map("n", "<leader>vr", ":VimspectorReset<CR>", opts)
    map("n", "<leader>ve", ":VimspectorEval", opts)
    map("n", "<leader>vw", ":VimspectorWatch", opts)
    map("n", "<leader>vo", ":VimspectorShowOutput", opts)
    map("n", "<leader>vi", "<Plug>VimspectorBalloonEval", opts)
    map("x", "<leader>vi", "<Plug>VimspectorBalloonEval", opts)

    -- git fugitive
    map("n", "<Leader>Gd", ":Gvdiffsplit<CR>", opts)
    map("n", "<Leader>Dh", ":diffget //2<CR>", opts)
    map("n", "<Leader>Dl", ":diffget //3<CR>", opts)

    -- close buffer without save
    map("n", "bq", ":bd!<CR>", opts)

    -- sniprun
    map("n", "<leader>r", "<Plug>SnipRun<CR>", { silent = true })
    map("n", "<leader>o", "<Plug>SnipRunOperator<CR>", { silent = true })
    map("v", "r", "<Plug>SnipRun<CR>", { silent = true })

    map("n", "<leader>B", ":lua require('telescope').extensions.bookmarks.bookmarks(opts)<CR>", opts)
end

return M
