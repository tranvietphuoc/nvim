-- luasnip setup
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local M = {}

function M.setup()
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s%") ~= nil
    end

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- for luasnip
                -- vim.fn["vsnip#anonymous"](args.body) -- for vsnip
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<C-j>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip and luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                elseif check_backspace() then
                    vim.fn.feedkeys(t("<Tab>"), "")
                else
                    fallback()
                end
            end,
            ["<C-k>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip and luasnip.jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end,
        },
        sources = {
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "treesitter" },
            { name = "path" },
            { name = "buffer" },
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        formatting = {
            format = require("lspkind").cmp_format(),
        },
    })
    -- Autopairs
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    -- lsp servers
    local lsp_servers = {
        "clangd",
        "pyright",
        "rust_analyzer",
        "gopls",
        "tsserver",
        "cssls",
        "sumneko_lua",
        "vuels",
        "yamlls",
        "vimls",
        "tailwindcss",
        "svelte",
        "jsonls",
        "dockerls",
        "html",
    }
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    for _, server in ipairs(lsp_servers) do
        lspconfig[server].setup({
            capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        })
    end
end

return M
