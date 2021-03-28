vim.g.ascii = {
    ' ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ ',
	'█  █  █ █       █       █  █ █  █   █  █▄█  █',
	'█   █▄█ █    ▄▄▄█   ▄   █  █▄█  █   █       █',
	'█       █   █▄▄▄█  █ █  █       █   █       █',
	'█  ▄    █    ▄▄▄█  █▄█  █       █   █       █',
	'█ █ █   █   █▄▄▄█       ██     ██   █ ██▄██ █',
	'█▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█',
}

vim.g.startify_custom_header = 'startify#pad(g:ascii + startify#fortune#boxed())'

vim.g.webdevicons_enable_startify = 1
vim.g.startify_enable_special = 0
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_session_dir = '~/.config/nvim/session'
vim.api.nvim_exec(
	'let g:startify_lists = [ { \'type\': \'files\', \'header\': [ \'Files\' ] }, { \'type\': \'sessions\',  \'header\': [ \'Sessions\' ] }, { \'type\': \'bookmarks\', \'header\': [ \'Bookmarks\' ] }, ]',
	true
	)
vim.api.nvim_exec(
	'let startify_bookmarks = [ { \'.py\': \'~/Desktop/python/\' }, { \'.js\': \'~/Desktop/javascript/\' }, { \'.rs\': \'~/Desktop/rust/\' }, { \'.go\': \'~/go-workspace/src/github.com/tranvietphuoc/\' }, { \'.c\': \'~/Desktop/c/\' }, { \'.nvim\': \'~/.config/nvim/\' } ]',
	true
	)

vim.cmd([[
function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
]])
vim.g.startify_padding_left = 3
