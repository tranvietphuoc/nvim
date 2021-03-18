vim.cmd([[
    if finddir('.venv', '.;')
        let g:python3_host_prog = './.venv/bin/python'
    endif
    let g:python3_host_prog = '/usr/local/bin/python'
]])
