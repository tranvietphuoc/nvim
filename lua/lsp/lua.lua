-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- local sumneko_root = DATA .. "/lsp_servers/sumneko_lua"
local sumneko_binary = DATA .. "/mason/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local M = {}

function M.setup()
    require("lspconfig").lua_ls.setup({
        cmd = { sumneko_binary }, -- "-E", sumneko_root .. "/extension/server/bin/main.lua" },
        on_attach = require("lsp").common_on_attach,
        flags = lsp_flags,
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
            },
        },
    })
end

return M
