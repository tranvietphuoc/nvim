local M = {}


local utils = require("lspconfig.util")
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

function M.setup()
    lspconfig.gopls.setup {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
            gopls = {
                analyses = { assign = true,
                    atomic = true,
                    bools = true,
                    composites = true,
                    copylocks = true,
                    deepequalerrors = true,
                    embed = true,
                    errorsas = true,
                    fieldalignment = true,
                    httpresponse = true,
                    ifaceassert = true,
                    loopclosure = true,
                    lostcancel = true,
                    nilfunc = true,
                    nilness = true,
                    nonewvars = true,
                    printf = true,
                    shadow = true,
                    shift = true,
                    simplifycompositelit = true,
                    simplifyrange = true,
                    simplifyslice = true,
                    sortslice = true,
                    stdmethods = true,
                    stringintconv = true,
                    structtag = true,
                    testinggoroutine = true,
                    tests = true,
                    timeformat = true,
                    unmarshal = true,
                    unreachable = true,
                    unsafeptr = true,
                    unusedparams = true,
                    unusedresult = true,
                    unusedvariable = true,
                    unusedwrite = true,
                    useany = true, },
                hoverKind = "FullDocumentation",
                linkTarget = "pkg.go.dev",
                vulncheck = "Imports",
                usePlaceholders = true,
                staticcheck = true,
                gofumpt = true,
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
        -- single_file_support = true,
        root_dir = utils.root_pattern("go.mod", "go.work", ".git"),
        -- init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,

    }
end

return M
