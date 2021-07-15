vim.cmd('filetype plugin on') -- filetype detection
vim.cmd("set showcmd")
vim.cmd('set iskeyword+=-')  -- treat dash seperate words as word text object
vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|.
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.opt.tabstop = 4 -- Insert 2 spaces for a tab
vim.opt.shiftwidth = 4 -- Change the number of space characters inserted for indentation
vim.opt.expandtab = true -- Converts tabs to spaces
vim.cmd('set whichwrap+=<,>,[,],h,l')  -- move to next line with theses keys

-- vim.cmd('set modifiable')
vim.cmd('set nofoldenable')
-- vim.cmd('set rtp+=~/.fzf')  -- for fzf
vim.cmd('set colorcolumn=99999')
vim.cmd('set inccommand=split')
vim.cmd(' set clipboard+=unnamedplus')
-- vim.cmd('set autoindent')
vim.o.completeopt = "menuone,noselect"
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="'..TERMINAL..'"')
vim.o.titlestring="%<%F%=%l/%L - nvim"
vim.cmd('set foldmethod=expr')
vim.cmd('set foldexpr=nvim_treesitter#foldexpr()')
-- vim.g.nvim_tree_disable_netrw = O.nvim_tree_disable_netrw

vim.o.compatible = false
vim.o.pumheight = 10
vim.o.clipboard = "unnamedplus"
vim.wo.signcolumn = "yes"  -- alway show sign column
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.syntax = O.syntax
vim.o.guifont = O.fonts
vim.o.hidden = O.hidden_files  -- keep open multiple buffers
vim.o.title = true
vim.o.fileencoding = "utf-8"
vim.o.conceallevel = 0  -- to see `` in markdown files
vim.bo.smartindent = O.smart_indent
vim.wo.number = O.numbers
vim.wo.cursorline = O.cursor_line
vim.wo.wrap = O.wrap_line   -- display long lines as just one
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.cmdheight = 2
vim.o.showtabline = O.show_tabline
--vim.o.t_Co = O.color
vim.o.ruler = O.ruler
vim.o.updatetime = O.update_time  -- faster completion
vim.o.timeoutlen = O.timeout_len  -- timeout to 1s
vim.wo.relativenumber = O.relative_numbers

-- config ts and sw for special files
vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79')
vim.cmd[[
autocmd BufRead,BufNewFile *.html,*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.sass,*.json,*.yml,*.lua,*.svelte setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
]]
vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8')
