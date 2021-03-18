-- toggle nerdtree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
-- vim.cmd('nnoremap <Leader>n :NERDTreeToggle<CR>')
-- vim.cmd('nnoremap <Leader>v :NERDTreeFind<CR>')
-- nerdtree finding file
-- vim.api.nvim_set_keymap('n', '<Leader>fd', ':NERDTreeFind<CR>', {noremap = true, silent = true})

-- nerdtree quit automatically
vim.cmd('let NERDTreeQuitOnOpen = 1')
vim.cmd('autocmd bufenter * if (winnr(\"$\")) == 1 && exists(\"b:NERDTreeType\") && (b:NERDTreeType == \"primary\") | q | endif')
vim.cmd('let NERDTreeAutoDeleteBuffer = 1')
vim.cmd('let NERDTreeMinimalUI = 1')
vim.cmd('let NERDTreeDirArrows = 1')
vim.cmd('let g:netrw_banner=0')
-- vim.cmd('et g:netrw_liststyle=3')
vim.cmd('let g:netrw_localrmdir=\'rm -r\'')
-- highlighting
vim.cmd('let g:NERDTreeFileExtensionHighlightFullName = 1')
vim.cmd('let g:NERDTreeHighlightFolders = 1')
vim.cmd('let g:NERDTreeHighlightFoldersFullName = 1')
vim.cmd('let g:NERDTreePatternMatchHighlightFullName = 1')
vim.cmd('let g:NERDTreeExactMatchHighlightFullName = 1')
vim.cmd('let g:NERDTreeGitStatusIndicatorMapCustom = { \'Modified\': \'✹\', \'Staged\': \'✚\', \'Untracked\': \'✭\', \'Renamed\': \'➜\', \'Unmerged\': \'═\', \'Deleted\': \'✖\', \'Dirty\': \'✗\', \'Clean\': \'✔︎\', \'Ignored\': \'☒\', \'Unknown\': \'?\' }')
vim.cmd('let g:NERDTreeGitStatusShowIgnored = 1')
vim.cmd('let g:NERDTreeGitStatusEnable=1')
vim.cmd('let g:NERDTreeShowHidden=1')
vim.cmd('let g:NERDTreeWinSize=30')
vim.cmd('let NERDTreeDirArrows=1')
vim.cmd('let NERDTreeIgnore = [ \'\\.swp$\', \'.DS_Store\', \'\\.pyc$\', \'__pycache__\', \'node_modules\' ]')

vim.cmd('let g:NERDTreeSyntaxEnabledExtensions=[ \'c\', \'css\', \'h\', \'html\', \'jpg\', \'js\', \'jsx\', \'json\', \'lock\', \'md\', \'cpp\', \'lua\', \'py\', \'sass\', \'vue\', \'scss\', \'rs\', \'go\', \'ts\', \'vim\', \'sql\', \'exs\', \'csv\', \'db\', \'sh\', \'xml\', \'rb\', \'rst\' ]')

vim.cmd('let g:NERDTreeSyntaxDisableDefaultExtensions = 1')
vim.cmd('let g:WebDevIconsUnicodeDecorateFolderNodes = 1')
vim.cmd('let g:DevIconsEnableFoldersOpenClose = 1')
