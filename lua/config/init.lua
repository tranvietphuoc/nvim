local globals = {}

DATA = vim.fn.stdpath("data")
CACHE = vim.fn.stdpath("cache")

function globals.init()
    local cmd = vim.cmd
    local o = vim.o
    local bo = vim.bo
    local wo = vim.wo
    local g = vim.g
    local opt = vim.opt

    g.mapleader = ","

    cmd("filetype plugin indent on") -- filetype detection
    cmd("set showcmd")
    cmd("set whichwrap+=<,>,[,],h,l") -- move to next line with theses keys
    cmd("set modifiable")
    cmd("set nofoldenable")
    cmd("set colorcolumn=99999")
    cmd("set inccommand=split")
    cmd("set shortmess+=c")
    -- cmd("hi Normal guibg=NONE ctermbg=NONE")
    -- cmd([[colorscheme dracula]])
    -- cmd([[colorscheme tokyonight-night]])
    -- cmd([[colorscheme tokyonight-storm]])
    -- cmd([[colorscheme tokyonight-moon]])
    -- cmd([[colorscheme tokyonight-day]])
    -- cmd([[colorscheme dawnfox]])
    -- cmd([[colorscheme kanagawa-wave]])

    -- opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.

    opt.laststatus = 3 -- always display status line
    g.did_load_filetypes = 1
    o.foldmethod = "expr"
    o.foldexpr = "nvim_treesitter#foldexpr()"
    o.foldlevel = 10
    TERMINAL = vim.fn.expand("$TERMINAL")
    cmd([[let &titleold                            = "' .. TERMINAL .. '"]])
    o.titlestring = "%<%F%=%l/%L - nvim"
    -- o.completeopt = "menuone,noselect"
    vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
    opt.tabstop = 4 -- Insert 2 spaces for a tab
    opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
    opt.expandtab = true -- Converts tabs to spaces
    opt.softtabstop = 4
    o.breakindent = true
    -- o.compatible = true
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
    g.loaded_python_provider = 0
    g.python3_host_prog = "/usr/bin/python"
    g.loaded_netrw = 1
    g.loaded_netrwPlugin = 1

    -- backspace
    opt.backspace = "indent,eol,start"

    -- clipboard
    g.clipboard = {
        name = "wl-clipboard",
        copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy",
        },
        paste = {
            ["+"] = "wl-paste",
            ["*"] = "wl-paste",
        },
        cache_enabled = 0,
    }
    opt.clipboard:append("unnamedplus")

    opt.iskeyword:append("-") -- treat dash seperate words as word
    opt.runtimepath:append("~/.fzf/bin/fzf") --runtimepath -- for mac

    g.doge_doc_standard_python = true
    g.doge_doc_standard_javascript = true
    g.background = "light"
end

function globals:setup()
    globals.init()
    require("config.autocmd").setup()
    require("config.keymappings").setup()
end

return globals
