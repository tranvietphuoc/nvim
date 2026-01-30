return {
    setup = function()
        require("dbg.adapters").setup()

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
            element_mappings = {
            },
            -- Expand lines larger than the window
            expand_lines = vim.fn.has("nvim-0.7") == 1,
            layouts = {
                {
                    elements = {
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
                enabled = true,
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
    end,
}
