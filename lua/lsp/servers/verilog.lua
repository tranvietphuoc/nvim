local M = {}
local utils = require('lspconfig.util')
local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.svls.setup {
        cmd = { DATA .. "/mason/bin/svls" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "verilog", "systemverilog", "sv" },
        root_dir = utils.find_git_ancestor(),
        single_file_support = true,
    }
end

return M
