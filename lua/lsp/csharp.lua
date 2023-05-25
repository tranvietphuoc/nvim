local M = {}

local root_pattern = require("lspconfig/util").root_pattern
local lspconfig = require("lspconfig")
local omnisharp_bin = DATA .. "/mason/bin/omnisharp-mono"
local pid = vim.fn.getpid()

function M.setup()
    lspconfig["omnisharp"].setup({
        -- cmd = { "dotnet", DATA .. "/mason/packages/omnisharp-mono/omnisharp/OmniSharp.dll" },
        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
        on_attach = require("lsp").common_on_attach,
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        organize_imports_on_format = false,
        enable_roslyn_analyzers = false,
        enable_import_completion = false,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
        filetypes = { "cs", "vb" },
        root_dir = root_pattern(".csproj"),
        init_options = {},
    })
end

return M
