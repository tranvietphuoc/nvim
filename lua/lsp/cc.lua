local M = {}
local lsputils = require("lsp.utils")

function M.setup()
    require("lspconfig").clangd.setup({
        cmd = { DATA .. "/mason/bin/clangd" },
        on_attach = require("lsp").common_on_attach,
        -- handlers = {
        -- ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.diagnostic.on_publish_diagnostics, {
        -- virtual_text = true,
        -- signs = true,
        -- underline = true,
        -- update_in_insert = true,
        -- })
        -- },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cc", "h", "hpp" },
        handlers = lsputils.lsp_diagnostics(),
    })
    --[[ require("lspconfig").ccls.setup({
        cmd = { DATA .. "/lsp_servers/ccls/bin/ccls" },
        filetype = { "c", "cpp", "cc", "h", "hpp" },
        offset_encoding = "utf-8",
        root_dir = require("lspconfig/util").root_pattern("compile_commands.json", ".ccls", ".git"),
        single_file_support = false,
        cache = {
            directory = ".ccls-cache",
        },
        init_options = {
            compilationDatabaseDirectory = "build",
            index = {
                threads = 0,
            },
            clang = {
                excludeArgs = { "-frounding-math" },
            },
        },
    }) ]]
end

return M
