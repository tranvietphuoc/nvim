-- luasnip setup
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local cmp_buffer = require('cmp_buffer')

local M = {}

function M.setup()
    require("luasnip.loaders.from_vscode").lazy_load({ exclude = { "go" } })

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s%") ~= nil
    end

    local select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- for luasnip
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },

        window = {},

        mapping = cmp.mapping.preset.insert({
            -- ["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
            -- ["<C-n>"] = cmp.mapping.select_next_item(select_opts),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete({}),
            -- cancel selection
            ["<C-e>"] = cmp.mapping.abort(),
            -- confirm selection
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),

            ["<Tab>"] = cmp.mapping(function(fallback)
                --[[ local col = vim.fn.col('.') - 1

                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                    fallback()
                else
                    cmp.complete()
                end ]]
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip and luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                elseif check_backspace() then
                    vim.fn.feedkeys(t("<Tab>"), "")
                else
                    fallback()
                end
            end, { 'i', 's' }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                --[[ if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                else
                    fallback()
                end ]]
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip and luasnip.jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
            { name = "luasnip" },
            { name = "nvim_lsp" },
            -- { name = "vsnip" },
            { name = "treesitter" },
            { name = "path" },
            { name = "buffer" },
        }, {
            {
                name = 'buffer',
                option = {
                    -- Complete from all visible buffers.
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                },
            },
        }),
        window = {
            completion = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
            documentation = {
                border = 'rounded',
                winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
            },
        },
        -- completion = { completeopt = "menu,menuone,noselect" },
        formatting = {
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    require('clangd_extensions.cmp_scores'),
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                }
            },

            -- lspkind
            format = lspkind.cmp_format({
                mode = "symbol",
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                symbol_map = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "",
                },
                ellipsis_char = "...",
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


        }
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
end

return M
