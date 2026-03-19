local function toSnakeCase(str)
    return string.gsub(str, "%s*[- ]%s*", "_")
end

local function setup()
    local ok_ext, omnisharpExtended = pcall(require, "omnisharp_extended")
    local handlers = {}
    if ok_ext then
        handlers["textDocument/definition"] = omnisharpExtended.handler
    end

    local capabilities = require("lsp").capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = true,
        lineFoldingOnly = true,
    }

    local config = {
        name = "omnisharp",
        cmd = { DATA .. "/mason/bin/OmniSharp", "--languageserver" },
        handlers = handlers,
        capabilities = capabilities,
        enable_roslyn_analysers = true,
        enable_import_completion = true,
        organize_imports_on_format = true,
        enable_decompilation_support = true,
        enable_editorconfig_support = true,
        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = true,
            },
            MsBuild = {
                LoadProjectsOnDemand = false,
            },
            RoslynExtensionsOptions = {
                EnableAnalyzersSupport = true,
                EnableImportCompletion = true,
                AnalyzeOpenDocumentsOnly = false, -- Scan all documents for errors
                EnableDecompilationSupport = true,
            },
            Sdk = {
                IncludePrereleases = false,
            },
        },
        init_options = { AutomaticWorkspaceInit = true },
    }

    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "cs", "csproj", "sln" },
        callback = function(ev)
            local bufname = vim.api.nvim_buf_get_name(ev.buf)
            if bufname == "" then return end

            local root = vim.fs.find({ "*.sln", "*.csproj", ".git" }, { upward = true, path = bufname })[1]
            local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

            local server_config = vim.deepcopy(config)
            server_config.root_dir = root_dir
            server_config.on_attach = function(client, bufnr)
                require("lsp").common_on_attach(client, bufnr)

                if client.name == "omnisharp" then
                    local tokenLegend = client.server_capabilities.semanticTokensProvider and client.server_capabilities.semanticTokensProvider.legend
                    if tokenLegend then
                        local tokenModifiers = tokenLegend.tokenModifiers
                        if tokenModifiers then
                            for i, v in ipairs(tokenModifiers) do
                                tokenModifiers[i] = toSnakeCase(v)
                            end
                        end

                        local tokenTypes = tokenLegend.tokenTypes
                        if tokenTypes then
                            for i, v in ipairs(tokenTypes) do
                                tokenTypes[i] = toSnakeCase(v)
                            end
                        end
                    end
                end
            end

            vim.lsp.start(server_config, { bufnr = ev.buf })
        end,
    })
end

return {
    setup = setup,
}
