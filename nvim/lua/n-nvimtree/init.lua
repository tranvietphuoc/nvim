local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- vim.g.nvim_tree_side = 'right' -- left by default
-- vim.g.nvim_tree_width = 30 -- 30 by default
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '__pycache__', '.venv'}  -- empty by default
vim.g.nvim_tree_gitignore = 1 -- 0 by default
vim.g.nvim_tree_auto_open = 0 -- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_close = 1  -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_quit_on_open = 1  -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_follow = 0  -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1  -- 0 by default, this option shows indent markers when folders are open
-- vim.g.nvim_tree_hide_dotfiles = 1  -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_git_hl = 0  -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_root_folder_modifier = ':~'  -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_tab_open = 0  -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_width_allow_resize  = 1  -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_disable_netrw = 1  -- 1 by default, disables netrw
-- vim.g.nvim_tree_hijack_netrw = 1  -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
vim.g.nvim_tree_add_trailing = 0  -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_disable_window_picker = 1 --0 by default, will disable the window picker.
vim.g.nvim_tree_icon_padding = ' ' --one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
-- vim.g.nvim_tree_update_cwd = 0 -- 1 by default, will update the tree cwd when changing nvim's directory (DirChanged event). Behaves strangely with autochdir set.
-- vim.g.nvim_tree_group_empty = 0  -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_lsp_diagnostics = 0  -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
vim.g.nvim_tree_show_icons = {
  git =  0,
  folders = 0,
  files =  1,
  folder_arrows = 0,
}
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {'packer', 'qf'},
  buftype = {'terminal'},
}
vim.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'Dockerfile', 'docker-compose.yml' } 
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' } 
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath
--
-- default will show icon by default if no icon is provided
-- default shows no icon by default


-- toggle - find - refesh
map('n', '<Leader>n', ':NvimTreeToggle<CR>', opts)
map('n', '<Leader>F', ':NvimTreeFindFile<CR>', opts)
map('n', '<Leader>R', ':NvimTreeRefresh<CR>', opts)

-- mappings
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["<CR>"]           = tree_cb("edit"),
  ["o"]              = tree_cb("edit"),
  ["l"]              = tree_cb("edit"),
  ["<2-LeftMouse>"]  = tree_cb("edit"),
  ["<2-RightMouse>"] = tree_cb("cd"),
  ["<C-]>"]          = tree_cb("cd"),
  ["<C-v>"]          = tree_cb("vsplit"),
  ["<C-x>"]          = tree_cb("split"),
  ["<C-t>"]          = tree_cb("tabnew"),
  ["<"]              = tree_cb("prev_sibling"),
  [">"]              = tree_cb("next_sibling"),
  ["<BS>"]           = tree_cb("close_node"),
  ["h"]              = tree_cb("close_node"),
  ["<S-CR>"]         = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["y"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}

-- icons
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "",
    staged = "",
    unmerged = "",
    renamed = "",
    untracked = "",
    -- ignored = "",
  },
  folder = {
    arrow_open = "",
    arrow_closeed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = ""
  }
}
