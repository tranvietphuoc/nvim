-- https://github.com/lua_ls/lua-language-server/wiki/Build-and-Run-(Standalone)
local lua_ls_binary = DATA .. "/mason/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local function setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua" },
        callback = function(ev)
            local root = vim.fs.find({ ".git", "init.lua" }, { upward = true, path = vim.api.nvim_buf_get_name(ev.buf) })[1]
            local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

            vim.lsp.start({
                name = "lua_ls",
                cmd = { lua_ls_binary },
                on_attach = require("lsp").common_on_attach,
                root_dir = root_dir,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            },
                            checkThirdParty = false,
                            maxPreload = 1000,
                            preloadFileSize = 100,
                        },
                        telemetry = {
                            enable = false,
                        },
                        hint = {
                            enable = true,
                        },
                    },
                },
            }, {
                bufnr = ev.buf,
                reuse_client = function(client, conf)
                    return client.name == conf.name and client.config.root_dir == conf.root_dir
                end,
            })
        end,
    })
end

return {
    setup = setup,
}
