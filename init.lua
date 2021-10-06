local fn = vim.fn
local execute = vim.api.nvim_command

local function packer_init()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    end
    vim.cmd("packadd! packer.nvim")
    vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
end

packer_init()

-- general
require("config.autocmd").setup()
require("config").setup()
require("plugins").setup()
require("config.keymappings").setup()

-- extensions
require("extensions").setup()

-- lsp config
require("lsp").setup()
require("extensions.cmp").setup() -- autocomplete

-- formatter
require("extensions.formatters").setup()

-- lsp server
require("lsp.bash").setup()
require("lsp.clangd").setup()
require("lsp.cmake").setup()
require("lsp.css").setup()
require("lsp.docker").setup()
require("lsp.go").setup()
require("lsp.html").setup()
require("lsp.json").setup()
require("lsp.python").setup()
require("lsp.rust").setup()
require("lsp.tsserver").setup()
require("lsp.vim").setup()
-- require('lsp.vue-lsp')
require("lsp.yaml").setup()
require("lsp.lua").setup()
require("lsp.svelte").setup()
require("lsp.tailwindcss").setup()

-- debugger
require("debugger").setup()
require("debugger.dapinstall").setup()
require("debugger.ui").setup()
