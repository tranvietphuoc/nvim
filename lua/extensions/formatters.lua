local M = {}

-- define formatters

function M.setup()
  local black =  function ()
    return { exe = "black", args = {"-l 80", "-q", "-"}, stdin = true }
  end

  local prettier = function ()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
      stdin = true
    }
  end

  local clangfmt = function ()
    return {
      exe = "clang-format",
      args = {"-style=file", "--assume-filename", vim.api.nvim_buf_get_name(0)},
      stdin = true,
      cwd = vim.fn.expand('%:p:h')  -- run clang-format in cwd of the file
    }
  end

  local rustfmt = function ()
    return { exe = "rustfmt", args = {"--emit=stdout"}, stdin = true }
  end

  local luafmt = function ()
    return { exe = "luafmt", args = {"--indent-count", 2, "--stdin"}, stdin = true }
  end

  local gofmt = function ()
    return {
      exe = "gofmt",
      args = {vim.api.nvim_buf_get_name(0)},
      stdin = true,
    }
  end

  local stylua = function ()
    return {
      exe = 'stylua',
      args = {
        '--config-path '
        .. ".stylua.toml",
        "-",
      },
      stdin = true,
    }
  end

  -- config
  require("formatter").setup({
    filetype = {
      python = { black },
      javascript = { prettier },
      typescript = { prettier },
      javascriptreact = { prettier },
      typescriptreact = { prettier },
      html = {prettier},
      htmldjango = { prettier },
      css = {prettier},
      rust = { rustfmt },
      cpp = { clangfmt },
      c = { clangfmt },
      cc= { clangfmt },
      h = { clangfmt },
      go = { gofmt },
      lua = { stylua },
    }
  })

end

return M


