local python_args = {}

local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}

local black = {formatCommand = "black --quiet --stdin-filename ", formatStdin = true}

if O.python.linter == 'flake8' then table.insert(python_arguments, flake8) end

if O.python.isort then table.insert(python_arguments, isort) end

if O.python.formatter == 'yapf' then
    table.insert(python_arguments, yapf)
elseif O.python.formatter == 'black' then
    table.insert(python_arguments, black)
end


local lua_arguments = {}
local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

if O.lua.formatter == 'lua-format' then table.insert(lua_arguments, luaFormat) end


-- tsserver
local tsserver_args = {}

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

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

require"lspconfig".efm.setup {
    
    cmd = {DATA .. "/lspinstall/efm/efm-langserver"},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"lua", "python", "javascriptreact", "javascript", "html", "css", "json", "yaml"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            lua = lua_arguments,
            javascript = tsserver_args,
            javascriptreact = tsserver_args,
            html = {prettier},
            css = {prettier},
            json = {prettier},
            yaml = {prettier},
        }
    }
