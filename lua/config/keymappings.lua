local M = {}

local opts = { noremap = true, silent = true }
function M.setup()
    local map = vim.api.nvim_set_keymap

    --split view
    -- map("n", "<leader>|", ":vsplit<CR>", opts)
    -- map("n", "<leader>-", ":split<CR>", opts)

    -- navigating
    --- move between splitted windows
    --[[ map("n", "<C-k>", ":wincmd k<CR>", opts)
    map("n", "<C-j>", ":wincmd j<CR>", opts)
    map("n", "<C-h>", ":wincmd h<CR>", opts)
    map("n", "<C-l>", ":wincmd l<CR>", opts) ]]

    -- move selected line / blocks of text in V-mode
    -- Move selected line / block of text in visual mode
    --[[ map("x", "K", ":move '<-2<CR>gv-gv", opts)
    map("x", "J", ":move '>+1<CR>gv-gv", opts) ]]
    -- shifting selected line by select block and use > + l(or shift + . + l) and < + h (or shif + , + h)

    -- git fugitive
    -- map("n", "<leader>Dh", ":diffget //2<CR>", opts)
    -- map("n", "<leader>Dl", ":diffget //3<CR>", opts)

    -- close buffer without save
    map("n", "bq", ":bd!<CR>", opts)



    -- vimspector
    map("n", "<leader>vc", ":lua require('telescope').extensions.vimspector.configurations()<CR>", opts)
    map("n", "<leader>vl", ":call vimspector#Launch()<CR>", opts)
    map("n", "<leader>vr", ":VimspectorReset<CR>", opts)
    map("n", "<leader>ve", ":VimspectorEval", opts)
    map("n", "<leader>vw", ":VimspectorWatch", opts)
    map("n", "<leader>vo", ":VimspectorShowOutput", opts)
    map("n", "<leader>vi", "<Plug>VimspectorBalloonEval", opts)
    map("x", "<leader>vi", "<Plug>VimspectorBalloonEval", opts)


    -- codelens
    --[[ opts.desc = "code_lens"
    map("n", "<leader>lcld", "<cmd>lua vim.lsp.codelens.refresh()<cr>", opts)
    map("n", "<leader>lclr", "<cmd>lua vim.lsp.codelens.run()<cr>", opts) ]]
end

return M
