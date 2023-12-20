local M = {}


local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

function M.setup()
    lspconfig.cmake.setup {
        cmd = { DATA .. "/mason/bin/cmake-language-server" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        root_dir = utils.root_pattern(".git", "CMakePresets.json", "build", "CMakeLists.txt"),
        single_file_support = true,
    }
end

return M
