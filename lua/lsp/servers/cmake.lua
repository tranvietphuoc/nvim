local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local lspconfig = require("lspconfig")
local utils = require("lspconfig.util")

function M.setup()
    lspconfig.cmake.setup {
        cmd = { DATA .. "/mason/bin/cmake-language-server" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        flags = lsp_flags,
        root_dir = utils.root_pattern(".git", "CMakePresets.json", "build", "CMakeLists.txt"),
        single_file_support = true,
    }
end

return M
