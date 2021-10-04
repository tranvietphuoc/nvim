local dap = require('dap')

-- python
dap.adapters.python = {
  type = 'executable';
  command = vim.fn.stdpath('data') .. "/dapinstall/python/bin/python";
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
   -- The first three options are required by nvim-dap
    type = dap.adapters.python; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
     -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      local python_path = cwd .. '/.venv/bin/python'
      if vim.fn.executable(python_path) == 1 then
        return python_path
      elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. "/venv/bin/python"
      else
        return '~/.pyenv/shims/python'
      end
    end;
  },
}
-- cpp
dap.adapters.cppdbg = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/dapinstall/ccppr_vsc/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp