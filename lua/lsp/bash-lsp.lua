-- require'lspconfig'.bashls.setup {
--     cmd = {DATA .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
-- 	cmd_env = {
--       GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
--     },
-- 	filetype = { "sh" },
--     on_attach = require'lsp'.common_on_attach,

-- }
--
require'lspconfig'.bashls.setup{
	cmd = {DATA .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
    on_attach = require'lsp'.common_on_attach
}
