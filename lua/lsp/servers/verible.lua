local M = {}
local util = require("lspconfig.util")

function M.setup()
    --[[ lspconfig.svls.setup {
        cmd = { DATA .. "/mason/bin/svls" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "verilog", "systemverilog", "sv" },
        -- root_dir = utils.root_pattern(".svls.toml", ".git"),
        root_dir = utils.find_git_ancestor(),
        single_file_support = true,
    } ]]
    vim.lsp.config("verible", {
        cmd = { DATA .. "/mason/bin/verible-verilog-ls", "--rules_config_search" },
        -- cmd = { "verible-verilog-ls" },
        on_attach = require("lsp").common_on_attach,
        root_dir = function()
            return vim.loop.cwd()
        end,
        -- filetypes = { "systemverilog", "verilog" },
        single_file_support = true,
    })
    vim.lsp.enable("verible")
end

return M
