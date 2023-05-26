local M = {}

function M.setup()
    require("lspconfig").verible.setup({
        cmd = { "svls" },
        filetypes = { "verilog", "systemverilog" },
        root_dir = require("lspconfig").util.find_git_ancestor(),
    })
end

return M
