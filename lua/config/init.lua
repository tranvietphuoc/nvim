local cmd = vim.cmd
local o = vim.o
local b = vim.bo
local w = vim.wo

cmd "filetype plugin indent on" -- filetype detection
cmd "set showcmd"
cmd "set iskeyword+=-"  -- treat dash seperate words as word text object
cmd "set whichwrap+=<,>,[,],h,l"  -- move to next line with theses keys
cmd "set modifiable"
cmd "set nofoldenable"
cmd "set colorcolumn=99999"
cmd "set inccommand=split"
vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
vim.g.did_load_filetypes = 1
TERMINAL = vim.fn.expand('$TERMINAL')
vim.g.did_load_filetypes = 1

o.foldmethod                                   = 'expr'
o.foldexpr                                     = 'nvim_treesitter#foldexpr()'
o.foldlevel                                    = 10
TERMINAL                                       = vim.fn.expand('$TERMINAL')
vim.cmd('let                  &titleold        = "' .. TERMINAL .. '"')
cmd [[ let &titleold                           = "' .. TERMINAL .. '" ]]
o.titlestring                                  = "%<%F%=%l/%L - nvim"
o.completeopt                                  = "menuone,noselect"
b.tabstop                                      = 4 -- Insert 2 spaces for a tab
b.shiftwidth                                   = 4 -- Change the number of space characters inserted for indentation
b.expandtab                                    = true -- Converts tabs to spaces
--                            vim.o.compatible = true
o.pumheight                                    = 10
o.clipboard                                    = "unnamedplus"
w.signcolumn                                   = "yes:1"  -- alway show sign column
o.backup                                       = false
o.swapfile                                     = false
o.writebackup                                  = false
o.splitbelow                                   = true
o.splitright                                   = true
o.syntax                                       = "on"
o.guifont                                      = "FiraCode\\ Nerd\\ Font:h13"
o.hidden                                       = false  -- keep open multiple buffers
o.title                                        = true
o.fileencoding                                 = "utf-8"
o.conceallevel                                 = 0  -- to see `` in markdown files
b.smartindent                                  = true
b.autoindent                                   = true
o.smarttab                                     = true
w.number                                       = true
w.cursorline                                   = true
w.wrap                                         = false   -- display long lines as just one
o.mouse                                        = "a"
o.showmode                                     = false
o.cmdheight                                    = 2
o.showtabline                                  = 2
o.ruler                                        = true
o.updatetime                                   = 300  -- faster completion
o.timeoutlen                                   = 500  -- timeout to 1s
w.relativenumber                               = true
o.termguicolors                                = true

vim.g.loaded_python_provider                   = 0
vim.g.python3_host_prog                        = O.py_provider

-- config ts and sw for special files
-- vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120')
cmd[[
  autocmd BufRead,BufNewFile *.html,*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.json,*.yml,*.lua,*.svelte setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]]
cmd 'autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8'
