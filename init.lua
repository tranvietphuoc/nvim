local fn = vim.fn
local execute = vim.api.nvim_command

local function packer_init()
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    end
    -- vim.cmd("packadd packer.nvim")
    vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
end

packer_init()

-- general
require("config.autocmd").setup()
require("config").setup()
require("plugins").setup()
require("config.keymappings").setup()

-- ext
require("ext").setup()

-- lsp config
require("lsp").setup()
-- require("ext.cmp").setup()

-- code formatter
-- require("ext.formatters").setup()

-- lsp server
require("lsp.bash").setup()
require("lsp.cpp").setup()
require("lsp.cmake").setup()
require("lsp.css").setup()
require("lsp.docker").setup()
require("lsp.go").setup()
require("lsp.html").setup()
require("lsp.python").setup()
require("lsp.rust").setup()
require("lsp.tsserver").setup()
require("lsp.vim").setup()
require("lsp.vue").setup()
require("lsp.yaml").setup()
require("lsp.sql").setup()
require("lsp.tex").setup()
require("lsp.lua").setup()
require("lsp.tailwindcss").setup()
require("lsp.emmet").setup()
require("lsp.solidity").setup()
require("lsp.nullls").setup()
require("lsp.cmp").setup()

-- debugger
require("debugger").setup()
