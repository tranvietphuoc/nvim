local util = require("lspconfig.util")
local path = util.path
local lsputils = require("lsp.utils")
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()
local Path = require("plenary.path")

local M = {}

local function find_extra_paths(root_dir)
    local root_path = Path:new(root_dir)
    return {
        tostring(root_path),
        tostring(root_path:joinpath("odoo")), -- odoo github
        -- tostring(root_path:joinpath("odoo", "odoo")), -- Odoo core modules
        -- tostring(root_path:joinpath("odoo", "addons")), -- Official addons
        tostring(root_path:joinpath("my_addons")), -- Custom addons
    }
end

function M._python_path(workspace)
    local venv_python = path.join(workspace, ".venv", "bin", "python")
    if vim.fn.executable(venv_python) == 1 then
        return venv_python
    end
    -- fallback to system python3
    return vim.fn.exepath("python3") or "python"
end

function M.python_attach(client, bufnr)
    -- Disable Ruff hover
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "ruff" then
                client.server_capabilities.hoverProvider = false
            end
        end,
        desc = "LSP: Disable hover capability from Ruff",
    })

    require("lsp").common_on_attach(client, bufnr)
end

function M.setup()
    lspconfig.pyright.setup({
        cmd = { DATA .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = M.python_attach,
        handlers = lsputils.lsp_diagnostics(),
        root_dir = function(fname)
            return util.search_ancestors(fname, function(dir)
                if vim.fn.isdirectory(dir .. "/odoo") == 1 then
                    return dir
                elseif vim.fn.isdirectory(dir .. "/.git") == 1 then
                    return dir
                elseif vim.fn.isdirectory(dir .. "/.venv") == 1 then
                    return dir
                end
            end)
        end,
        on_init = function(client)
            local root_dir = client.config.root_dir
            local extra_paths = find_extra_paths(root_dir)

            client.config.settings.python = {
                pythonPath = M._python_path(root_dir),
                analysis = {
                    ignore = { "*" },

                    extraPaths = extra_paths,
                    typeCheckingMode = "off",
                    autoSearchPaths = false,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",

                    -- Force Pyright to recognize odoo as a module
                    autoImportUserSymbols = true,
                    autoImportCompletions = true,
                    importFormat = "relative",

                    stubPath = tostring(Path:new(root_dir, ".stubs")),
                },
            }

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end,
        settings = {
            pyright = {
                disableOrganizeImports = true,
            },
        },
        single_file_support = true,
    })

    lspconfig.ruff.setup({
        on_attach = M.python_attach,
        filetypes = { "python" },
        init_options = {
            settings = {
                organizeImports = true,
                showSyntaxErrors = true,
                lint = {
                    enable = true,
                    args = { "--select=ARG,E,F,E501", "--ignore=E4,E7,F401" },
                },
                format = {
                    preview = true,
                    args = { "--config", "./pyproject.toml" },
                },
                codeAction = {
                    disableRuleComment = { enable = false },
                    fixViolation = { enable = true },
                },
                logLevel = "debug",
            },
        },
    })
end

return M
