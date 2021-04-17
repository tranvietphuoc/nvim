vim.api.nvim_set_keymap('n', '<Leader>n', ':NERDTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', {noremap = true, silent = true})
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''
vim.g.NERDTreeHijackNetrw=1
vim.g.NERDTreeIgnore = {'.pyc$', '~$', '.swp$'}

-- nerdtree git plugin
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeGitStatusShowIgnored = 1
vim.g.NERDTreeGitStatusUntrackedFilesMode = 'all'

-- syntax highlighting
vim.g.NERDTreeFileExtensionHighlightFullName = 1
vim.g.NERDTreeExactMatchHighlightFullName = 1
vim.g.NERDTreePatternMatchHighlightFullName = 1
vim.g.NERDTreeHighlightFolders = 1
vim.g.NERDTreeHighlightFoldersFullName = 1
vim.g.WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
vim.g.WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
vim.g.NERDTreeLimitedSyntax = 1


vim.g.NERDTreeGitStatusIndicatorMapCustom = {
  Modified = ' ',
  Staged = ' ',
  Untracked = '六',
  Renamed = '凜',
  Unmerged = ' ',
  Deleted = ' ',
  Dirty = ' ',
  Ignored = ' ',
  Clean = '',
  Unknown = '?'
}

