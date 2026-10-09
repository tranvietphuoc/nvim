local deprecated = {}
local original_deprecate = vim.deprecate

vim.deprecate = function(name, alternative, version, plugin)
    table.insert(deprecated, {
        name = name,
        alternative = alternative,
        version = version,
        plugin = plugin,
    })
end

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.deprecate = original_deprecate
        assert(#deprecated == 0, "deprecated APIs called during startup: " .. vim.inspect(deprecated))
        assert(not vim.o.ttyfast, "NVIM_NOTTYFAST must be set before Neovim starts")

        local live_server = require("lazy.core.config").plugins["live-server.nvim"]
        assert(live_server, "live-server.nvim is not registered")
        assert(
            live_server.url == "https://forge.barrettruth.com/barrettruth/live-server.nvim",
            "live-server.nvim must use the Forgejo origin"
        )

        vim.g.deprecated_api_startup_check = "OK"
    end,
})
