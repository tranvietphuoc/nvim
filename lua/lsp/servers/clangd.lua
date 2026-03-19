local lsputils = require("lsp.utils")

local function setup()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp", "cuda", "proto", "cc", "h", "hpp" },
        callback = function(ev)
            local root = vim.fs.find({ ".git", "compile_commands.json", "compile_flags.txt" }, { upward = true, path = vim.api.nvim_buf_get_name(ev.buf) })[1]
            local root_dir = root and vim.fs.dirname(root) or vim.fn.getcwd()

            vim.lsp.start({
                name = "clangd",
                cmd = { DATA .. "/mason/bin/clangd", "--offset-encoding=utf-16", "--query-driver=/usr/bin/gcc" },
                on_attach = function(client, bufnr)
                    require("lsp").common_on_attach(client, bufnr)
                    client.server_capabilities.signatureHelpProvider = false
                end,
                root_dir = root_dir,
                handlers = lsputils.lsp_diagnostics(),
            }, {
                bufnr = ev.buf,
            })
        end,
    })
    require("clangd_extensions").setup({
        -- autoSetHints = false,
        inlay_hints = {
            -- inline = vim.fn.has("nvim-0.10") == 1,
            -- Options other than `highlight' and `priority' only work
            -- if `inline' is disabled
            -- Only show inlay hints for the current line
            only_current_line = true,
            -- Event which triggers a refresh of the inlay hints.
            -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = { "CursorHold" },
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },

        ast = {
            -- These are unicode, should be available in any font
            role_icons = {
                type = "🄣",
                declaration = "🄓",
                expression = "🄔",
                statement = ";",
                specifier = "🄢",
                ["template argument"] = "🆃",
            },
            kind_icons = {
                Compound = "🄲",
                Recovery = "🅁",
                TranslationUnit = "🅄",
                PackExpansion = "🄿",
                TemplateTypeParm = "🅃",
                TemplateTemplateParm = "🅃",
                TemplateParamObject = "🅃",
            },
            highlights = {
                detail = "Comment",
            },
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    })
end

return {
    setup = setup,
}
