local dap = require("dap")
-- local vscode = require('dap.ext.vscode')

local M = {}

function M.setup()
    -- sign_define for breakpoints
    vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

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

    -- cpp
    dap.adapters.codelldb = function(on_adapter)
        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        -- CHANGE THIS!
        local cmd = "/Users/phuoc/.vscode/extensions/vadimcn.vscode-lldb-1.6.8/adapter/codelldb"
        local handle, pid_or_err
        local opts = {
            stdio = { nil, stdout, stderr },
            detached = true,
        }
        handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
            stdout:close()
            stderr:close()
            handle:close()
            if code ~= 0 then
                print("codelldb exited with code", code)
            end
        end)
        assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
        stdout:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                local port = chunk:match("Listening on port (%d+)")
                if port then
                    vim.schedule(function()
                        on_adapter({
                            type = "server",
                            host = "127.0.0.1",
                            port = port,
                        })
                    end)
                else
                    vim.schedule(function()
                        require("dap.repl").append(chunk)
                    end)
                end
            end
        end)
        stderr:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
    end

    dap.configurations.cpp = {
        -- vscode.load_launchjs(),
        {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
end

return M
