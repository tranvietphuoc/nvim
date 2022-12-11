local M = {}

function M.setup()
    require("lspconfig").jdtls.setup({
        cmd = {
            DATA .. "/mason/bin/jdtls",
            "-configuration",
            "$HOME/.cache/jdtls/config/",
            "-data",
            "$HOME/.cache/jdtls/workspace/",
        },
        init_options = {
            jvm_args = {},
            workspace = "~/.cache/jdtls/workspace",
        },
        file_single_support = true,
        root_dir = {
            -- Single-module projects
            {
                -- "build.xml", -- Ant
                "pom.xml", -- Maven
                -- "settings.gradle", -- Gradle
                -- "settings.gradle.kts", -- Gradle
            },
            -- Multi-module projects
        } or vim.fn.getcwd(),
    })
end

return M
