O = {
    auto_complete = true,
    colorscheme = 'nvcode',
    hidden_files = true,
    wrap_line = true,
    numbers = true,
    show_modes = true,
    relative_numbers = true,
    title = true,
	ruler = true,
	smart_indent = true,
	show_match = true,
	expand_tab = true,
	cursor_line = true,
	syntax = "on",
	font = "FiraCode\\ Nerd\\ Font:h13",
	mouse = "a",
	color = "256",
	file_type = "on",
	cmd_height = 1,  -- cmd height
	show_tabline = 2,  -- tabline
	update_time = 300,
	timeout_len = 500,

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = true},
    },

    database = {save_location = '~/.config/nvim/db', auto_execute = 1},
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = '',
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    clangd = {diagnostics = {virtual_text = true, signs = true, underline = true}}
}

