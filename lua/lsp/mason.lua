local M = {}

function M.setup()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "rust_analyzer",
            "clangd",
            "pyright",
            "gopls",
            "tsserver",
            "bashls",
            "cssls",
            "html",
            "cmake",
            "graphql",
            "jsonls",
            "sqlls",
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
            "omnisharp_mono",
            "svls",
        },
    })
end

return M
