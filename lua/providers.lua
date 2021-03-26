if vim.fn.finddir('.venv', '.;') then
    vim.g.python3_host_prog = "./venv/bin/python"
end
vim.g.python3_host_prog = "/usr/local/bin/python"
