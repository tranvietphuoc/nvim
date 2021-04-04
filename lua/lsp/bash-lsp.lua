require'lspconfig'.bashls.setup {
    cmd = {DATA .. "/lspinstall/bash/node_modules/bash-language-server/bin/main.js", "start"},
    on_attach = require'lsp'.common_on_attach
}
