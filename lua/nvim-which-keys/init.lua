-- local wk = require('whichkey_setup')

-- local visual_keymap = {
--     K = {':move \'<-2<CR>gv-gv', 'move line up'},
--     J = {':move \'>+1<CR>gv-gv', 'move line down'},
-- }
-- local local_keymap = {
--     r = {':!python %', 'run python'},
-- }

-- wk.register_keymap('visual', visual_keymap)
-- wk.register_keymap('localleader', local_keymap)

-- local keymap = {l = {name = '+lsp'}}
-- if client.resolved_capabilities.document_formatting then
--     keymap.l.f = {"<Cmd>lua vim.lsp.buf.formatting()<CR>", 'format'}
-- elseif client.resolved_capabilities.document_range_formatting then
--     keymap.l.f = {"<Cmd>lua vim.lsp.buf.range_formatting()<CR>", 'format'}
-- end
-- wk.register_keymap('leader', keymap, {noremap=true, silent=true, bufnr=bufnr})

-- wk.register_keymap('leader', keymap)
