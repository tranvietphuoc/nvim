-- https://github.com/lua_ls/lua-language-server/wiki/Build-and-Run-(Standalone)
local lua_ls_binary = DATA .. "/mason/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lspconfig = require("lspconfig")

local M = {}

function M.setup()
    lspconfig.lua_ls.setup({
        cmd = { lua_ls_binary }, -- "-E", lua_ls_root .. "/extension/server/bin/main.lua" },
        on_attach = require("lsp").common_on_attach,
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = runtime_path,
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
                hint = {
                    enable = true, -- necessary
                },
            },
        },
    })
end

return M
