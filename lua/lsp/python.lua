local util = require("lspconfig/util")
local path = util.path
local lsputils = require("lsp.utils")

local M = {}

function M.get_python_path(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
        return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
    end

    -- Find and use virtualenv from poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, "pyproject.toml"))
    if match ~= "" then
        local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
        return path.join(venv, "bin", "python")
    end

    -- Fallback to system Python.
    return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python3"
end

function M.setup()
    require("lspconfig").pyright.setup({
        -- require'nvim_lsp'.pyright.setup {
        cmd = { DATA .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        handlers = lsputils.lsp_diagnostics(),
        on_init = function(client)
            client.config.settings.python.pythonPath = M.get_python_path(client.config.root_dir)
        end,
    })
end

return M
