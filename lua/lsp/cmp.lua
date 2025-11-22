-- luasnip setup
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp = require("cmp")
local cmp_buffer = require("cmp_buffer")

local M = {}

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local select_opts = { behavior = cmp.SelectBehavior.Select }

function M.setup()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip").filetype_extend("typescript", { "javascript" })

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- for luasnip
                -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            end,
        },

        mapping = cmp.mapping.preset.insert({
            ["<C-u>"] = cmp.mapping.scroll_docs(-4), --Up
            ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
            -- cancel selection
            ["<C-Space>"] = cmp.mapping.complete(),
            -- confirm selection
            ["<CR>"] = cmp.mapping(function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    local entry = cmp.get_selected_entry()
                    if entry.source.name == "copilot" then
                        -- only confirm when selected Copilot (it's mean Tab come first then <CR> works)
                        cmp.confirm({ select = false })
                    else
                        -- another source => auto-select
                        cmp.confirm({ select = true })
                    end
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item(select_opts)
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item(select_opts)
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp", group_index = 2 },
            -- { name = "copilot", group_index = 2 },
            { name = "luasnip", group_index = 2 },
            { name = "nvim_lua", group_index = 2 },
            { name = "path", group_index = 2 },
            { name = "buffer" },
        }, {
            {
                name = "buffer",
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
                border = "rounded",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            },
            documentation = {
                border = "rounded",
                winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
            },
        },
        completion = { completeopt = "menu,menuone,noinsert,noselect" },
        formatting = {
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    require("clangd_extensions.cmp_scores"),
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

            -- lspkind
        },
        format = function(entry, vim_item)
            -- 1. Lưu lại tên gốc (VD: "Function", "Method")
            local original_kind = vim_item.kind

            -- 2. Gọi lspkind dùng PRESET
            local kind_with_icon = require("lspkind").cmp_format({
                mode = "symbol", -- Vẫn chỉ lấy mỗi Icon để tránh lỗi trùng lặp
                preset = "codicons",
                maxwidth = 50,
            })(entry, vim_item)

            kind_with_icon.kind = kind_with_icon.kind .. " " .. original_kind

            return kind_with_icon
        end,
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
