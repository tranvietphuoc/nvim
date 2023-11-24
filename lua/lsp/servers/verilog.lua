local M = {}
local lsputils = require('lspconfig').util


function M.setup()
    require("lspconfig").svls.setup({
        cmd = { DATA .. "/mason/bin/svls" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "verilog", "systemverilog", "sv" },
        root_dir = lsputils.find_git_ancestor(),
        single_file_support = true,
    })
end

return M
