local M = {}


local lspconfig = require("lspconfig")
local util = require 'lspconfig.util'
local async = require 'lspconfig.async'
local capabilities = require("lsp").capabilities()
local mod_cache = '/Users/phuoc/go/pkg/mod'

function M.setup()
    lspconfig.gopls.setup {
        cmd = { DATA .. "/mason/bin/gopls" },
        -- cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = function(fname)
            -- see: https://github.com/neovim/nvim-lspconfig/issues/804
            if not mod_cache then
                local result = async.run_command 'go env GOMODCACHE'
                if result and result[1] then
                    mod_cache = vim.trim(result[1])
                end
            end
            if fname:sub(1, #mod_cache) == mod_cache then
                local clients = vim.lsp.get_active_clients { name = 'gopls' }
                if #clients > 0 then
                    return clients[#clients].config.root_dir
                end
            end
            return util.root_pattern 'go.work' (fname) or util.root_pattern('go.mod', '.git')(fname)
        end,
        settings = {
            gopls = {
                analyses = {
                    assign = true,
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
        single_file_support = true,
        -- root_dir = util.root_pattern("go.mod", "go.work", ".git"),
        -- init_options = { usePlaceholders = true, completeUnimported = true },
        on_attach = require("lsp").common_on_attach,
        capabilities = capabilities,

    }
end

return M
