local util = require("lspconfig.util")
local path = util.path
local lsputils = require("lsp.utils")
local lspconfig = require("lspconfig")

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
local python_attach = function(client, bufnr)
    require("lsp").common_on_attach(client, bufnr)

    -- disable hover documentation of ruff, use pyright instead
    if client.name == 'ruff_lsp' then
        client.server_capabilities.hoverProvider = false
    end
end

function M.setup()
    lspconfig.pyright.setup {
        cmd = { DATA .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = python_attach,
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
            }
        },
        single_file_support = true,
    }

    -- ruff
    lspconfig.ruff.setup {
        init_options = {
            settings = {
                organizeImports = true,
                showSyntaxErrors = true,
                lint = {
                    enable = true,
                    --[[ select = { "E", "F" },
                    extendSelect = { "W" },
                    ignore = { "E4", "E7" }, ]]
                    run = "onType",
                    args = { "--config", "pyproject.toml" }
                },
                format = {
                    preview = true,
                    args = { "--config", "pyproject.toml" },
                },
                codeAction = {
                    disableRuleComment = {
                        enable = true
                    },
                    fixViolation = {
                        enable = true
                    }

                },
            },
        },
    }
end

return M
