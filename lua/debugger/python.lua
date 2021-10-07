local M = {}

function M.setup()
    local dap = require("dap")
    -- python
    dap.adapters.python = {
        type = "executable",
        -- command = vim.fn.stdpath('data') .. "/dapinstall/python/bin/python";
        command = function()
            local cwd = vim.fn.getcwd()
            local datapath = vim.fn.stdpath("data")
            if vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then -- should install debugpy to virtualenv
                return cwd .. "/.venv/bin/python"
            else
                return datapath .. "/dapinstall/python/bin/python"
            end
        end,
        args = { "-m", "debugpy.adapter" },
    }

    dap.configurations.python = {
        {
            -- The first three options are required by nvim-dap
            type = dap.adapters.python, -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",
            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                local python_path = cwd .. "/.venv/bin/python"
                if vim.fn.executable(python_path) == 1 then
                    return python_path
                elseif vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                else
                    return "~/.pyenv/shims/python"
                end
            end,
        },
    }
end

return M
