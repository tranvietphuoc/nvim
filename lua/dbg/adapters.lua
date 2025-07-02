local M = {}

function M.setup()
    local dap = require("dap")

    -- go
    --

    dap.adapters.delve = function(callback, config)
        if config.mode == "remote" and config.request == "attach" then
            callback({
                type = "server",

                host = config.host or "127.0.0.1",
                port = config.port or "38697",
            })
        else
            callback({
                type = "server",
                port = "${port}",
                executable = {
                    command = "dlv",
                    args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
                    detached = vim.fn.has("win32") == 0,
                },
            })
        end
    end

    -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
        {

            type = "delve",

            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}",
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}",
        },
    }

    -- rust lldb
    dap.adapters.codelldb = {
        type = "server",
        host = "localhost",
        port = 13000, -- 💀 Use the port printed out or specified with `--port`
    }

    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            -- CHANGE THIS to your path!
            command = DATA .. "/mason/bin/codelldb",
            args = { "--port", "${port}" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    }

    -- codelldb
    dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
            -- CHANGE THIS to your path!
            command = DATA .. "/mason/bin/codelldb",
            args = { "--port", "${port}" },

            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    }

    -- cpp lldb
    dap.configurations.cpp = {
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

    -- lua
    dap.adapters["local-lua"] = {
        type = "executable",
        command = "node",
        args = {
            "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js",
        },
        enrich_config = function(config, on_config)
            if not config["extensionPath"] then
                local c = vim.deepcopy(config)
                -- 💀 If this is missing or wrong you'll see
                -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
                c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
                on_config(c)
            else
                on_config(config)
            end
        end,
    }

    -- java
    dap.configurations.java = {
        {
            type = "java",
            request = "attach",
            name = "Debug (Attach) - Remote",
            hostName = "127.0.0.1",
            port = 5005,
        },
    }

    -- python
    dap.adapters.python = function(cb, config)
        if config.request == "attach" then
            ---@diagnostic disable-next-line: undefined-field
            local port = (config.connect or config).port
            ---@diagnostic disable-next-line: undefined-field
            local host = (config.connect or config).host or "127.0.0.1"
            cb({
                type = "server",
                port = assert(port, "`connect.port` is required for a python `attach` configuration"),
                host = host,
                options = {
                    source_filetype = "python",
                },
            })
        else
            cb({
                type = "executable",
                command = DATA .. "/mason/packages/debugpy/venv/bin/python",
                args = { "-m", "debugpy.adapter" },
                options = {
                    source_filetype = "python",
                },
            })
        end
    end

    dap.configurations.python = {
        {
            --Odoo docker attach
            type = "python",
            request = "attach",
            name = "Attach to docker",
            connect = {
                host = "localhost",
                port = 5679,
            },
            pathMappings = {
                {
                    localRoot = "${workspaceFolder}/my_addons/",
                    remoteRoot = "/mnt/my_addons/",
                },
                {
                    localRoot = "${workspaceFolder}/odoo/odoo",
                    remoteRoot = "/usr/lib/python3/dist-packages/odoo",
                },
            },
        },
        {
            -- launch
            -- The first three options are required by nvim-dap
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Launch file",

            -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end,
        },
    }

    -- vscode-js-debug
    dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
            command = "node",
            -- 💀 Make sure to update this path to point to your installation
            args = { "/path/to/js-debug/src/dapDebugServer.js", "${port}" },
        },
    }

    dap.configurations.javascript = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
    }

    -- csharp
    dap.adapters.coreclr = {
        type = "executable",
        command = DATA .. "/mason/bin/netcoredbg",
        args = { "--interpreter=vscode" },
    }
    dap.configurations.cs = {
        {
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end,
        },
    }
end

return M
