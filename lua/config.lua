vim.cmd('filetype plugin indent on')
vim.cmd('set nocompatible')
vim.cmd('set nobackup')
vim.cmd('set noswapfile')
vim.cmd("set showcmd")
vim.cmd('set ts=4')
vim.cmd('set sw=4')
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.cmd('set shortmess+=c')
vim.cmd('set iskeyword+=-')  -- treat dash seperate words as word text object
vim.cmd('set laststatus=2')
vim.cmd('set undolevels=1000')  -- undo history
vim.cmd('set lazyredraw')
vim.cmd('set hlsearch')
vim.cmd('set incsearch')
vim.cmd('set signcolumn=yes')
vim.cmd('set ttyfast')
vim.cmd('set errorformat=%f:%l:\\ %m')
vim.cmd('set modifiable')
vim.cmd('set clipboard=unnamedplus')
vim.cmd('set nofoldenable')
vim.cmd('set rtp+=~/.fzf')
vim.cmd('set rtp+=/usr/local/opt/fzf')
vim.cmd[[ set termguicolors ]]
vim.cmd[[ set smarttab ]]
vim.cmd[[ set redrawtime=1000 ]]

vim.o.syntax = O.syntax
vim.o.guifont = O.font
-- vim.g.mapleader = ","
vim.o.hidden = O.hidden_files  -- keep open multiple buffers
vim.o.title = O.title
vim.o.filetype = O.file_type
vim.o.fileencoding = "utf-8"
vim.o.conceallevel = 0  -- to see `` in markdown files
vim.bo.smartindent = O.smart_indent
vim.wo.number = O.numbers
vim.wo.cursorline = O.cursor_line
vim.wo.wrap = O.wrap_line   -- display long lines as just one
vim.o.mouse = O.mouse
vim.o.showmode = O.show_modes
vim.o.cmdheight = O.cmd_height
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmatch = O.show_match
vim.bo.expandtab = O.expand_tab  -- convert tabs to spaces
vim.o.showtabline = O.show_tabline
vim.o.t_Co = O.color
vim.o.ruler = O.ruler
vim.o.updatetime = O.update_time  -- faster completion
vim.o.timeoutlen = O.timeout_len  -- timeout to 1s
vim.wo.relativenumber = O.relative_numbers

-- config ts and sw for special files
vim.cmd('autocmd BufRead,BufNewFile *.py setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79')
vim.cmd('autocmd BufRead,BufNewFile *.html,*.js,*.ts,*.tsx,*.jsx,*.css,*.scss,*.sass,*.json,*.yml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2')
vim.cmd('autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=8 shiftwidth=8')

DATA = vim.fn.stdpath('data')
CACHE = vim.fn.stdpath('cache')

if vim.fn.has('nvim') == 1 then
    --
end
