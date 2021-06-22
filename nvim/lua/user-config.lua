--[[O is the global options object for settings,
formatters and linters 
]] 

-- general
O.auto_complete = true  -- auto completion
O.colorscheme = 'nvcode'  -- can be change to another colorscheme
O.hidden_files = true
O.wrap_line = false
O.numbers = true
O.show_modes = true
O.relative_numbers = true
O.title = true
O.ruler = true
O.smart_indent = true
O.show_match = true
O.expand_tab = true  -- convert tabs to spaces
O.cursor_line = true
O.syntax = "on"  -- can be 'on', 'enable', 'off'
O.fonts = "FiraCode Nerd Font:h14"  -- canbe change to another font
O.mouse = "a"  -- mouse mode
O.color = "256"  -- terminal color
O.cmd_height = 2  -- cmd height
O.show_tabline = 2  -- tabline
O.update_time = 300  -- faster completion
O.timeout_len = 400  -- timeout to type keybinding
O.termguicolors = true
O.py_provider = "$HOME/.pyenv/versions/3.9.4/bin/python"
O.nvim_tree_disable_netrw = 0

-- treesitter
O.treesitter.ensure_installed = {
  "javascript",
  "html",
  "css",
  "bash",
  "lua",
  "c",
  "cpp",
  "python",
  "rust",
  "go",
  "json",
  "tsx",
  "typescript",
  "regex",
  "vue",
  "svelte"
}
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true
O.treesitter.playground.enabled = true
O.treesitter.rainbow.enabled = true

-- lua
-- @usage can be 'lua-format'
O.lua.formatter = 'lua-format'
O.lua.autoformat = false
O.lua.diagnostics.virtual_text = true
O.lua.diagnostics.signs = true
O.lua.diagnostics.underline = true

-- sh
O.sh.linter = ''  -- @usage can be 'shellcheck'
O.sh.formatter = ''
O.sh.autoformat = false
O.sh.diagnostics.virtual_text = true
O.sh.diagnostics.signs = true
O.sh.diagnostics.underline = true

-- tsserver
O.tsserver.linter = 'eslint'  -- @usage can be 'eslint'
O.tsserver.formatter = 'prettier'  -- @usage can be 'prettier'
O.tsserver.autoformat = true
O.tsserver.diagnostics.virtual_text = true
O.tsserver.diagnostics.signs = true
O.tsserver.diagnostics.underline = true

-- json
O.json.formatter = 'prettier'  -- @usage can be 'prettier'
O.json.autoformat = true
O.json.diagnostics.virtual_text = true
O.json.diagnostics.signs = true
O.json.diagnostics.underline = true

-- python
O.python.linter = 'flake8'
O.python.formatter = 'yapf'  -- @usage can be 'yapf', 'black'
O.python.autoformat = true
O.python.isort = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true

-- clangd
O.clangd.diagnostics.virtual_text = true
O.clangd.diagnostics.signs = true
O.clangd.diagnostics.underline = true

-- dbui
O.database.save_location = '~/.config/nvim/db'
O.database.auto_execute = 1


