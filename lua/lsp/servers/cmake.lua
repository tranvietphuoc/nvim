local function setup()
    vim.lsp.config("cmake", {
        cmd = { DATA .. "/mason/bin/cmake-language-server" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "cmake" },
        init_options = { buildDirectory = "build" },
        root_dir = vim.fs.dirname(
            vim.fs.find({ ".git", "CMakePresets.json", "build", "CMakeLists.txt" }, { upward = true })[1]
        ),
        single_file_support = true,
    })
end

return {
    setup = setup,
}
