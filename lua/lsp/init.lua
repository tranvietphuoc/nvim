local function map(...) vim.api.nvim_set_keymap(...) end
local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local cmd = vim.cmd
local opts = { noremap=true, silent=true }
local function sign_define(...) vim.fn.sign_define(...) end

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

-- lspsaga
require'lspsaga'.init_lsp_saga()
-- jump diagnostic
map('n', '[e', ':Lspsaga diagnostic_jump_next<CR>', opts)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<CR>', opts)
-- signature_help
map('n', '<Leader>gs', ':Lspsaga signature_help<CR>', opts)
-- rename
map('n', '<Leader>gr', ':Lspsaga rename<CR>', opts)
-- preview definition
map('n', '<Leader>gd', ':Lspsaga preview_definition<CR>', opts)
-- show diagnostic
map('n', '<Leader>cd', '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>', opts)
-- async lsp finder
map('n', '<Leader>gf', ':Lspsaga lsp_finder<CR>', opts)
-- scroll down hover doc or scroll in definition preview
map('n', '<C-f>',  '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', opts)
-- scroll up hover doc
map('n', '<C-b>', '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', opts)
map('n', '<Leader>ca', ':Lspsaga code_action<CR>', opts)
map('v', '<Leader>ca', ':<C-U>Lspsaga range_code_action<CR>', opts)
cmd[[command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()]]

-- edit sign
sign_define("LspDiagnosticsSignError", {texthl = "LspDiagnosticsSignError", text = "", numhl="LspDiagnosticsSignError"})
sign_define("LspDiagnosticsSignWarning",{texthl = "LspDiagnosticsSignWarning", text = "", numhl="LspDiagnosticsSignWarning"})
sign_define("LspDiagnosticsSignHint",{texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
sign_define("LspDiagnosticsSignInformation",{texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

-- lsp config
buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_map('n', 'K', ':Lspsaga hover_doc<CR>', opts)
buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)


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

local lsp_config = {}
function lsp_config.common_on_attach(client, bufnr)
  documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
  lsp_config.common_on_attach(client, bufnr)
  client.resolved_capabilities.document_formatting = false
end

return lsp_config
