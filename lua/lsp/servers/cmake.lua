local M = {}

local util = require("lspconfig").util

function M.setup()
    vim.lsp.config("cmake", {
        cmd = { DATA .. "/mason/bin/cmake-language-server" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        root_dir = util.root_pattern(".git", "CMakePresets.json", "build", "CMakeLists.txt"),
        single_file_support = true,
    })
end

return M
