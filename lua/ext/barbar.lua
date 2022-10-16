local M = {}

function M.setup()
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map("n", "<Tab>", "<Cmd>BufferNext<CR>", opts)
    map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", opts)


    map('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', opts)
    map('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', opts)
    map('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>', opts)
    map('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>', opts)
    map('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>', opts)
    map('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>', opts)
    map('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>', opts)
    map('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>', opts)
    map('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>', opts)
    map('n', '<Leader>0', '<Cmd>BufferLast<CR>', opts)

    map('n', '<S-c>', '<Cmd>BufferClose<CR>', opts)
    map('n', '<S-p>', '<Cmd>BufferPin<CR>', opts)

    map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
    map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
    map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
    map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
end

return M
