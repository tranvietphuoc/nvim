-- lspsaga
require'lspsaga'.init_lsp_saga()
-- lsp config
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ca', ':Lspsaga code_action<CR>', opts)
vim.api.nvim_set_keymap('v', '<Leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
-- jump diagnostic
vim.api.nvim_set_keymap('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
vim.api.nvim_set_keymap('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- signature_help
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Lspsaga signature_help<CR>', opts)
-- rename
vim.api.nvim_set_keymap('n', '<Leader>gr', ':Lspsaga rename<CR>', opts)
-- preview definition
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Lspsaga preview_definition<CR>', opts)
-- show diagnostic
vim.api.nvim_set_keymap('n', '<Leader>cd', '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>', opts)
-- async lsp finder
vim.api.nvim_set_keymap('n', '<Leader>gf', ':Lspsaga lsp_finder<CR>', opts)

-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>',  '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', opts)
-- scroll up hover doc
vim.api.nvim_set_keymap('n', '<C-b>', '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', opts)
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- edit sign
vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

local function documentHighlight(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#454545
      hi LspReferenceText cterm=bold ctermbg=red guibg=#454545
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#454545
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END]], false)
  end
end

require'nvim-lightbulb'.update_lightbulb {
  sign = {
    enabled = true,
    -- Priority of the gutter sign
    priority = 10,
  },
  float = {
    enabled = false,
    -- Text to show in the popup float
    text = "💡",
		win_opts = {},
  },
	virtual_text = {
    enabled = false,
    -- Text to show at virtual text
    text = "💡",
  }
}

-- lsp kind
require('lspkind').init({
})


local lsp_config = {}
function lsp_config.common_on_attach(client, bufnr)
  documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
  lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

return lsp_config
