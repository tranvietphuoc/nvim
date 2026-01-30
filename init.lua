if vim.g.vscode then
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap("n", "<Space>w", '<Cmd>call VSCodeNotify("workbench.action.files.save")<CR>', opts)
    keymap("n", "<Space>q", '<Cmd>call VSCodeNotify("workbench.action.closeActiveEditor")<CR>', opts)
else
    -- globals
    vim.g.mapleader = ","
    vim.g.maplocalleader = ","
    DATA = vim.fn.stdpath("data")
    vim.opt.termguicolors = true

    -- general
    require("plugins").setup()
    require("config.autocmd").setup()
    require("config").setup()
    require("config.keymappings").setup()

    -- ext
    require("ext").setup()

    -- lsp config
    require("lsp").setup()

    -- debugger
    require("dbg").setup()
end
