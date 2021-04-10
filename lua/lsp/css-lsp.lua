-- npm install -g vscode-css-languageserver-bin
-- require'lspconfig'.cssls.setup {
-- 	cmd = { "node", DATA .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio" },
--     on_attach = require'lsp'.common_on_attach,
-- 	settings = {
--       css = {
--         validate = true
--       },
--       less = {
--         validate = true
--       },
--       scss = {
--         validate = true
--       },
--   },
-- }
require'lspconfig'.cssls.setup {
  cmd = {
    "node", DATA .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js", "--stdio"
  },
  on_attach = require'lsp'.common_on_attach
}
