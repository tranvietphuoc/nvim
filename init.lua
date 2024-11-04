-- general
require("plugins").setup()
require("config.autocmd").setup()
require("config").setup()
require("config.keymappings").setup()

-- ext
require("ext").setup()

-- lsp config
require("lsp").setup()

-- debugger
require("dbg").setup()
