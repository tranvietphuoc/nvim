require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    on_attach = require'lspconfig'.efm.common_on_attach,
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {formatCommand = "lua-format -i", formatStdin = true}
            }
        }
    }
}
