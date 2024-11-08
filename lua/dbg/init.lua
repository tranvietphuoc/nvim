-- local vscode = require('dap.ext.vscode')

local M = {}

local dap = require("dap")

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
            command = DATA .. "/mason/bin/debugpy",
            args = { "-m", DATA .. "/mason/bin/debugpy-adapter" },
            options = {
                source_filetype = "python",
            },
        })
    end
end

dap.configurations.python = {
    {
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

function M.setup()
    local map = vim.keymap.set
    local opts = { silent = true, noremap = true }

    map("n", "<Leader>da", "<CMD>lua require('dap').continue()<CR>", opts)
    map("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
    map("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", opts)
    map("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", opts)
    map("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
    map("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
    map("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", opts)
    map("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", opts)
    map("n", "<Leader>du", "<CMD>lua require('dapui').open()<CR>", opts)
    map("n", "<Leader>dc", "<CMD>lua require('dapui').close()<CR>", opts)

    map("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
    map("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
    map("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)

    -- import adapters
    local dap, dapui = require("dap"), require("dapui")

    dap.listeners.before.attach.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end
    dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
        },
        -- Use this to override mappings for specific elements
        element_mappings = {
            -- Example:
            -- stacks = {
            --   open = "<CR>",
            --   expand = "o",
            -- }
        },
        -- Expand lines larger than the window
        -- Requires >= 0.7
        expand_lines = vim.fn.has("nvim-0.7") == 1,
        -- Layouts define sections of the screen to place windows.
        -- The position can be "left", "right", "top" or "bottom".
        -- The size specifies the height/width depending on position. It can be an Int
        -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
        -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
        -- Elements are the elements shown in the layout (in order).
        -- Layouts are opened in order so that earlier layouts take priority in window sizing.
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    { id = "scopes", size = 0.25 },
                    "breakpoints",
                    "stacks",
                    "watches",
                },
                size = 40, -- 40 columns
                position = "left",
            },
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 0.25, -- 25% of total lines
                position = "bottom",
            },
        },
        controls = {
            -- Requires Neovim nightly (or 0.8 when released)
            enabled = true,
            -- Display controls in this element
            element = "repl",
            icons = {
                pause = "",
                play = "",
                step_into = "",
                step_over = "",
                step_out = "",
                step_back = "",
                run_last = "↻",
                terminate = "□",
            },
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
        render = {
            max_type_length = nil, -- Can be integer or nil.
            max_value_lines = 100, -- Can be integer or nil.
        },
    })
end

return M
