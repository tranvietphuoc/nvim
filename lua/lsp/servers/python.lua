local util = require("lspconfig.util")
local path = util.path
local lsputils = require("lsp.utils")
local lspconfig = require("lspconfig")
local capabilities = require("lsp").capabilities()

local M = {}

function M.get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end
    -- Find and use virtualenv from poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "pyproject.toml"))
    if match ~= "" then
        local venv = vim.fn.trim(".venv") --vim.fn.system("poetry env info -p"))
        return path.join(venv, "bin", "python")
    end
    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python3"
end

-- callback to attach to python lsp client
function M.python_attach(client, bufnr)
    -- disable ruff hover
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client == nil then
                return
            end
            if client.name == "ruff" then
                --disable hover in favor of pyright
                client.server_capabilities.hoverProvider = false
            end
        end,
        desc = "LSP: Disable hover capability from Ruff",
    })

    require("lsp").common_on_attach(client, bufnr)
end

function M.setup()
    lspconfig.pylsp.setup({
        cmd = { DATA .. "/mason/bin/pylsp" },
        on_attach = M.python_attach,

        handlers = lsputils.lsp_diagnostics(),
        single_file_support = true,
        filetypes = { "python" },
        capabilities = capabilities,
        root_dir = function(fname)
            local root_files = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
            }

            return util.root_pattern(unpack(root_files))(fname)
                or util.find_git_ancestor(fname)
                or util.path.dirname(fname)
        end,
        settings = {
            pylsp = {
                plugins = {
                    -- pycodestyle = {},
                    pylsp_mypy = {
                        enabled = true,
                        -- overrides = { "--python-executable", py_path, true },
                        report_progress = true,
                        live_mode = false,
                    },
                },
            },
        },
    })

    --[[ lspconfig.pyright.setup({
        cmd = { DATA .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = M.python_attach,
        handlers = lsputils.lsp_diagnostics(),
        on_init = function(client)
            client.config.settings.python.pythonPath = M.get_python_path(client.config.root_dir)
        end,
        settings = {
            python = {
                analysis = {
                    -- ignore all files for analysis to exclusively use ruff for linting
                    ignore = { "*" },
                },
            },

            pyright = {
                -- using ruff's import organizer
                disableOrganizeImports = true,
            },
        },
        single_file_support = true,
    }) ]]

    -- ruff
    lspconfig.ruff.setup({
        on_attach = M.python_attach,
        filetypes = { "python" },
        init_options = {
            settings = {
                organizeImports = true,
                showSyntaxErrors = true,
                lint = {
                    enable = true,
                    --[[ select = { "E", "F" },
                    extendSelect = { "E501" },
                    ignore = { "E4", "E7", "F401" }, ]]
                    run = "onType",
                    args = { "--select=ARG,E,F,E501", "--ignore=E4,E7,F401" },
                },
                format = {
                    preview = true,
                    args = { "--config", "./pyproject.toml" },
                },
                codeAction = {
                    disableRuleComment = {
                        enable = false,
                    },
                    fixViolation = {
                        enable = true,
                    },
                },
            },
        },
    })
end

return M
