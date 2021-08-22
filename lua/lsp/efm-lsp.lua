-- python 
local python_args = {}
local flake8 = {
  LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet -", formatStdin = true}
local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet --stdin-filename ", formatStdin = true}
if O.python.linter == 'flake8' then table.insert(python_args, flake8) end
if O.python.isort then table.insert(python_args, isort) end
if O.python.formatter == 'yapf' then
  table.insert(python_args, yapf)
elseif O.python.formatter == 'black' then
  table.insert(python_args, black)
end

-- lua
local lua_args = {}
local luaFormat = {
  formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
  formatStdin = true
}
if O.lua.formatter == 'lua-format' then table.insert(lua_args, luaFormat) end

-- tsserver
local tsserver_args = {}

-- prettier
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

-- eslint
local eslint = {
  lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}
if O.tsserver.formatter == 'prettier' then table.insert(tsserver_args, prettier) end
if O.tsserver.linter == 'eslint' then table.insert(tsserver_args, eslint) end

-- setup
require"lspconfig".efm.setup {
  cmd = {DATA .. "/lspinstall/efm/efm-langserver"},
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {"lua", "python", "javascriptreact", "javascript", "typescript", "html", "json", "yaml"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = python_args,
      lua = lua_args,
      javascript = tsserver_args,
      javascriptreact = tsserver_args,
			typescript = tsserver_args,
      -- html = {prettier},
      -- css = {prettier},
      json = {prettier},
      yaml = {prettier},
    }
  }
}
