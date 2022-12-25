local cmd = vim.cmd
local o = vim.o
local bo = vim.bo
local wo = vim.wo
local g = vim.g
local opt = vim.opt
local path = vim.fn.stdpath

local M = {}

DATA = path("data")
CACHE = path("cache")

function M.setup()
    cmd("filetype plugin indent on") -- filetype detection
    cmd("set showcmd")
    cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
    cmd("set modifiable")
    cmd("set nofoldenable")
    cmd("set colorcolumn=99999")
    cmd("set inccommand=split")
    cmd("set shortmess+=c")
    cmd([[colorscheme dawnfox]])

    -- cmd "syntax on"
    -- cmd "colorscheme nvcode"
    -- opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.

    g.did_load_filetypes = 1
    o.foldmethod = "expr"
    o.foldexpr = "nvim_treesitter#foldexpr()"
    o.foldlevel = 10
    TERMINAL = vim.fn.expand("$TERMINAL")
    cmd([[let &titleold                            = "' .. TERMINAL .. '"]])
    o.titlestring = "%<%F%=%l/%L - nvim"
    o.completeopt = "menuone,noselect"
    bo.tabstop = 4 -- Insert 2 spaces for a tab
    bo.shiftwidth = 4 -- Change the number of space characters inserted for indentation
    bo.expandtab = true -- Converts tabs to spaces
    bo.softtabstop = 4
    o.breakindent = true
    o.scrolloff = 8
    --                            vim.o.compatible = true
    o.pumheight = 10
    o.pumblend = 3
    o.lazyredraw = true
    wo.signcolumn = "yes:1" -- alway show sign column
    o.backup = false
    o.swapfile = false
    o.writebackup = false
    o.splitbelow = true
    o.splitright = true
    o.syntax = "on"
    o.guifont = "Hack\\ Nerd\\ Font:h13"
    o.hidden = false -- keep open multiple buffers
    o.title = true
    o.fileencoding = "utf-8"
    o.conceallevel = 0 -- to see `` in markdown files
    bo.smartindent = true
    bo.autoindent = true
    o.smarttab = true
    wo.number = true
    wo.cursorline = true
    wo.wrap = false -- display long lines as just one
    o.mouse = "a"
    wo.scrolloff = 8
    o.showmode = false
    o.cmdheight = 1
    o.showtabline = 2
    o.ruler = true
    o.updatetime = 300 -- faster completion
    o.timeoutlen = 300 -- timeout to 1s
    wo.relativenumber = true
    o.termguicolors = true
    g.loaded_python_provider = 0
    g.python3_host_prog = "$HOME/.pyenv/shims/python3"

    -- backspace
    opt.backspace = "indent,eol,start"

    -- clipboard
    opt.clipboard:append("unnamed,unnamedplus")

    opt.iskeyword:append("-") -- treat dash seperate words as word
    opt.runtimepath:append("/usr/local/opt/fzf/") --runtimepath

    g.doge_doc_standard_python = true
    g.doge_doc_standard_javascript = true
end

return M
