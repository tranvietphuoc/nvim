
if vim.fn.finddir('.venv/', '.;') ~= nil  then
    vim.g.python3_host_prog = "./.venv/bin/python3"
else
    vim.g.python3_host_prog = "/Users/phuoc/miniconda3/envs/lab/bin/python3"
end

vim.g.loaded_python_provider = 0
