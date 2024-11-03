local M = {}

local root_pattern = require("lspconfig.util").root_pattern
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = true,
    lineFoldingOnly = true,
}

local omnisharpExtended = require("omnisharp_extended")

local function toSnakeCase(str)
    return string.gsub(str, "%s*[- ]%s*", "_")
end

local config = {
    handlers = {
        ["textDocument/definition"] = omnisharpExtended.handler,
        --[[ ["textDocument/typeDefinition"] = omnisharpExtended.type_definition_handler,
        ["textDocument/references"] = omnisharpExtended.references_handler,
        ["textDocument/implementation"] = omnisharpExtended.implementation_handler, ]]
    },

    cmd = { "dotnet", DATA .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },

    capabilities = capabilities,
    enable_roslyn_analyzers = true,
    enable_import_completion = true,
    organize_imports_on_format = true,
    enable_decompilation_support = true,
    enable_editorconfig_support = true,
    settings = {
        FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = true,
        },
        MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            LoadProjectsOnDemand = true,
        },
        Sdk = {
            IncludePrereleases = false,
        },
        RoslynExtensionsOptions = {

            -- Enables support for roslyn analyzers, code fixes and rulesets.
            EnableAnalyzersSupport = true,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            EnableImportCompletion = true,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = true,

            EnableDecompilationSupport = true,

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

    filetypes = { "cs", "csproj", "sln" },
    root_dir = root_pattern("*.csproj") or root_pattern("*.sln"),
    init_options = { AutomaticWorkspaceInit = true },
    on_attach = function(client, bufnr)
        require("lsp").common_on_attach(client, bufnr)

        if client.name == "omnisharp" then
            local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
            for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = toSnakeCase(v)
            end

            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
            for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = toSnakeCase(v)
            end
        end
    end,
}

function M.setup()
    lspconfig.omnisharp.setup(config)
end

return M
