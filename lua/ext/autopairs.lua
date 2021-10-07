local M = {}

function M.setup()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.setup({
        ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
        enable_check_bracket_line = false,
        check_ts = true,
        ts_config = {
            lua = { "string" }, -- it will not add a pair on that treesitter node
            javascript = { "template_string" },
            java = false, -- don't check treesitter on java
        },
    })

    local ts_conds = require("nvim-autopairs.ts-conds")
    -- press % => %% is only inside comment or string
    npairs.add_rules({
        Rule("%", "%", "htmldjango"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
    })

    npairs.add_rules({
        Rule(" ", " ")
            :with_pair(function(opts)
                local pair = opts.line:sub(opts.col - 1, opts.col)
                return vim.tbl_contains({ "()", "{}", "[]", "{%%}" }, pair)
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(function(opts)
                local col = vim.api.nvim_win_get_cursor(0)[2]
                local context = opts.line:sub(col - 1, col + 2)
                return vim.tbl_contains({ "(  )", "{  }", "[  ]", "{% %}" }, context)
            end),
        Rule("", " )")
            :with_pair(cond.none())
            :with_move(function(opts)
                return opts.char == ")"
            end)
            :with_cr(cond.none())
            :with_del(cond.none())
            :use_key(")"),
        Rule("", " }")
            :with_pair(cond.none())
            :with_move(function(opts)
                return opts.char == "}"
            end)
            :with_cr(cond.none())
            :with_del(cond.none())
            :use_key("}"),
        Rule("", " ]")
            :with_pair(cond.none())
            :with_move(function(opts)
                return opts.char == "]"
            end)
            :with_cr(cond.none())
            :with_del(cond.none())
            :use_key("]"),
        Rule("", " %}")
            :with_pair(cond.none())
            :with_move(function(opts)
                return opts.char == "%}"
            end)
            :with_cr(cond.none())
            :with_del(cond.none())
            :use_key("%}"),
    })
end

return M
