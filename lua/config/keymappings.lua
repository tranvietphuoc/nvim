local M = {}

function M.setup()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    vim.g.mapleader = "," -- global leader key
    -- fast escaping
    map("i", "qq", "<ESC>", opts)
    map("n", "qq", "<ESC>", opts)
    map("v", "qq", "<ESC>", opts)
    map("x", "qq", "<ESC>", opts)
    map("s", "qq", "<ESC>", opts)
    map("o", "qq", "<ESC>", opts)
    map("c", "qq", "<ESC>", opts)

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
    map("n", "<Leader>l", ":Bracey<CR>", opts)
    map("n", "<Leader>L", ":BraceyStop<CR>", opts)

    -- markdown preview
    map("n", "<Leader>m", "<Plug>MarkdownPreview<CR>", { noremap = false, silent = false })
    map("n", "<Leader>M", "<Plug>MarkdownPreviewStop<CR>", { noremap = false, silent = false })

    -- nvimtree
    map("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)
    map("n", "<Leader>R", ":NvimTreeRefresh<CR>", opts)

    -- telescope
    map("n", "<Leader>f", "<cmd>Telescope find_files<CR>", opts)
    map("n", "<Leader>F", "<cmd>Telescope live_grep<cr>", opts)

    -- map debugger in nvim-dap
    map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
    map("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
    map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
    map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
    map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
    map("n", "<F3>", ":lua require'dapui'.open()<CR>", opts)
    map("n", "<F4>", ":lua require'dapui'.toggle()<CR>", opts)
    map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
    map("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
    map("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
    map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
    map("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)

    -- git fugitive
    map("n", "<Leader>Gd", ":Gvdiffsplit<CR>", opts)
    map("n", "<Leader>Dh", ":diffget //2<CR>", opts)
    map("n", "<Leader>Dl", ":diffget //3<CR>", opts)

    -- close buffer without save
    map("n", "bq", ":bd!<CR>", opts)
end

return M
