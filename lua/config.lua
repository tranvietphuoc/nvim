vim.cmd "filetype plugin indent on" -- filetype detection
vim.cmd "set showcmd"
vim.cmd "set iskeyword+=-"  -- treat dash seperate words as word text object
vim.cmd "set whichwrap+=<,>,[,],h,l"  -- move to next line with theses keys
vim.cmd "set modifiable"
vim.cmd "set nofoldenable"
vim.cmd "set colorcolumn=99999"
vim.cmd "set inccommand=split"
vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.

vim.o.foldmethod                               = 'expr'
vim.o.foldexpr                                 = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel                                = 10
TERMINAL                                       = vim.fn.expand('$TERMINAL')
vim.cmd('let                  &titleold        = "' .. TERMINAL .. '"')
vim.o.titlestring                              = "%<%F%=%l/%L - nvim"
vim.o.completeopt                              = "menuone,noselect"
vim.opt.tabstop                                = 4 -- Insert 2 spaces for a tab
vim.opt.shiftwidth                             = 4 -- Change the number of space characters inserted for indentation
vim.opt.expandtab                              = true -- Converts tabs to spaces
--                            vim.o.compatible = true
vim.o.pumheight                                = 10
vim.o.clipboard                                = "unnamedplus"
vim.wo.signcolumn                              = "yes:1"  -- alway show sign column
vim.o.backup                                   = false
vim.o.swapfile                                 = false
vim.o.writebackup                              = false
vim.o.termguicolors                            = true
vim.o.splitbelow                               = true
vim.o.splitright                               = true
vim.o.syntax                                   = "on"
vim.o.guifont                                  = "FiraCode\\ Nerd\\ Font:h13"
vim.o.hidden                                   = false  -- keep open multiple buffers
vim.o.title                                    = true
vim.o.fileencoding                             = "utf-8"
vim.o.conceallevel                             = 0  -- to see `` in markdown files
vim.bo.smartindent                             = true
vim.bo.autoindent                              = true
vim.o.smarttab                                 = true
vim.wo.number                                  = true
vim.wo.cursorline                              = true
vim.wo.wrap                                    = false   -- display long lines as just one
vim.o.mouse                                    = "a"
vim.o.showmode                                 = false
vim.o.cmdheight                                = 2
vim.o.showtabline                              = 2
vim.o.ruler                                    = true
vim.o.updatetime                               = 300  -- faster completion
vim.o.timeoutlen                               = 400  -- timeout to 1s
vim.wo.relativenumber                          = true
vim.o.termguicolors                            = true

-- config ts and sw for special files
vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120')
vim.cmd[[
  autocmd BufRead,BufNewFile *.html,*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.json,*.yml,*.lua,*.svelte setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]]
vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8')

