local M = {}

function M.setup()
    require("lspconfig").svls.setup({
        cmd = { DATA .. "/mason/bin/svls" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "verilog", "systemverilog", "sv" },
        root_dir = require("lspconfig").util.find_git_ancestor(),
    })
end

return M
