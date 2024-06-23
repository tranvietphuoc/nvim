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
        FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = nil,
        },
        MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            LoadProjectsOnDemand = nil,
        },
        Sdk = {
            IncludePrereleases = true
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = nil,

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
    filetypes = { "cs", "csproj", "sln" },
    root_dir = root_pattern("*.csproj") or root_pattern("*.sln"),
    init_options = {},
    on_attach = function(client, bufnr)
        require("lsp").common_on_attach(client, bufnr)
        -- vim.api.nvim_set_option_value(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    end,
}

function M.setup()
    lspconfig.omnisharp.setup(config)
end

return M
