-- luasnip setup
local luasnip = require 'luasnip'
local M = {}

function M.setup()
  local t = function (str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_backspace = function ()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s%" ~= nil
  end

  local cmp = require"cmp"
  cmp.setup{
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-n>'), 'n')
        elseif luasnip.expand_or_jumpable() then
          vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
          vim.fn.feedkeys(t('<C-p>'), 'n')
        elseif luasnip.jumpable(-1) then
          vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
        else
          fallback()
        end
      end,
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'luasnip' },
      { name = 'treesitter'}
    },
    completion = { completeopt = "menu,menuone,noinsert" },
  }
   -- Autopairs
  require("nvim-autopairs.completion.cmp").setup {
    map_cr = true,
    map_complete = true,
    auto_select = true,
  }
end

return M
