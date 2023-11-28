local M = {}

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

local lspconfig = require("lspconfig")

function M.setup()
    lspconfig.cmake.setup {
        cmd = { DATA .. "/mason/bin/cmake-language-server", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        flags = lsp_flags,
        root_dir = require("lspconfig.util").root_pattern(".git", "CMakePresets.json", "build", "cmake"),
        single_file_support = true,
    }
end

return M
