--[[O is the global options object
Formatters and linters 
]] 

-- general
O.auto_complete = true  -- auto completion
O.colorscheme = 'nvcode'
O.hidden_files = true
O.wrap_line = false
O.numbers = true
O.show_modes = true
O.relative_numbers = true
O.title = true
O.ruler = true
O.smart_indent = true
O.show_match = true
O.expand_tab = true
O.cursor_line = true

-- treesitter
O.treesitter.ensure_installed = {"javascript", "html", "css", "bash", "lua", "c", "cpp", "python", "rust", "go", "json", "yaml", "tsx", "typescript", "regex", "vue"}
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
O.python.isort = false
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
