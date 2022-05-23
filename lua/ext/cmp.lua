-- luasnip setup
local luasnip = require("luasnip")
local lspconfig = require("lspconfig")
local lspkind = require("lspkind")

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
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },

        window = {},

        mapping = cmp.mapping.preset.insert({
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
        }),
        sources = cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
            -- { name = "vsnip" },
            { name = "treesitter" },
            { name = "path" },
            { name = "buffer" },
        }),
        completion = { completeopt = "menu,menuone,noinsert" },
    })
    -- Autopairs
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = "buffer" },
        }),
    })

    --lspkind
    cmp.setup({
        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol",
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "ﰠ",
                    Variable = "",
                    Class = "ﴯ",
                    Interface = "",
                    Module = "",
                    Property = "ﰠ",
                    Unit = "塞",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "פּ",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                -- before = function(entry, vim_item)
                --     return vim_item
                -- end,
                cb = function(entry, vim_item)
                    local word = entry:get_insert_text()
                    if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                        word = vim.lsp.util.parse_snippet(word)
                    end
                    word = str.online(word)
                    if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
                        word = word .. "~"
                    end
                    vim_item.abbr = word
                    return vim_item
                end,
            }),
        },
    })

    -- lsp servers
    local lsp_servers = {
        "ccls",
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
