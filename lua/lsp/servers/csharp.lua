local M = {}

local root_pattern = require("lspconfig.util").root_pattern
local lspconfig = require("lspconfig")
-- local omnisharp_bin = DATA .. "/mason/bin/omnisharp"
-- local pid = vim.fn.getpid()
-- local capabilities = vim.lsp.protocol.make_client_capabilities() --require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = require("lsp").capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = true,
    lineFoldingOnly = true,
}


local config = {
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },

    -- cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    cmd = { "dotnet", DATA .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },

    capabilities = capabilities,
    settings = {
        RoslynExtensionsOptions = {
            InlayHintsOptions = {
                EnableForParameters = true,
                ForLiteralParameters = true,
                ForIndexerParameters = true,
                ForObjectCreationParameters = true,
                ForOtherParameters = true,
                SuppressForParametersThatDifferOnlyBySuffix = false,
                SuppressForParametersThatMatchMethodIntent = false,
                SuppressForParametersThatMatchArgumentName = false,
                EnableForTypes = true,
                ForImplicitVariableTypes = true,
                ForLambdaParameterTypes = true,
                ForImplicitObjectCreatio = true,
            },
        },
    },

    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = true,
    organize_imports_on_format = true,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
    filetypes = { "cs" },
    root_dir = root_pattern("*.csproj") or root_pattern("*.sln"),
    init_options = {},
    on_attach = function(client, bufnr)
        require("lsp").common_on_attach(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end,
}

function M.setup()
    lspconfig.omnisharp.setup(config)
end

return M
