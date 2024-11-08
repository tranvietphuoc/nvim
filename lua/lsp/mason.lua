local M = {}

function M.setup()
    require("mason").setup({
        ui = {
            icons = {

                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    })
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "pylyzer",
            "pylsp",
            "ruff",
            "gopls",
            "bashls",
            "cssls",
            "html",
            "cmake",
            "graphql",
            "jsonls",
            "sqls",
            "taplo",
            "vuels",
            "emmet_ls",
            "dockerls",
            "jdtls",
            "vimls",
            "tailwindcss",
            "texlab",
            "yamlls",
            "docker_compose_language_service",
            "omnisharp",
            "verible",
            "lemminx",
        },
    })

    require("mason-tool-installer").setup({
        ensure_installed = {
            "prettier",
            "ruff",
            "csharpier",
            "google-java-format",
            "mypy",
            "stylua",
            "eslint_d",
            "clang-format",
            "cpplint",
            "gofumpt",
            "goimports",
            "codespell",
            "djlint",
            "luacheck",
            "jsonlint",
            "vale",
        },
    })

    require("mason-nvim-dap").setup({
        ensure_installed = {
            "python", -- debugpy python
            "codelldb", -- cpp, c, rust
            "delve", -- go
            "coreclr", -- netcoredbg - c#
            "javatest", -- java
            "javadbg", -- java
            "js", -- javascript
        },
    })
end

return M
