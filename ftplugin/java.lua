local on_attach = function(client, bufnr)
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap()
    require("lsp-status").register_progress()
    require("lspsaga").init_lsp_saga()

    local function map(...)
        vim.keymap.set(...)
    end

    local opts = { noremap = true, silent = true }

    -- Java specific
    map("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    map("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    map("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local jdtls = require("jdtls")
local home = os.getenv("HOME")
local root_markers = { "gradlew", "pom.xml", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workplace = "/Desktop/learning/java/"
local workspace_dir = home .. workplace .. project_name


local capabilities = {
    workspace = {
        configuration = true,
    },
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = true,
            },
        },
    },
}

local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")

require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers
        .new(opts, {
            prompt_title = prompt,
            finder = finders.new_table({
                results = items,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = label_fn(entry),
                        ordinal = label_fn(entry),
                    }
                end,
            }),
            sorter = sorters.get_generic_fuzzy_sorter(),
            attach_mappings = function(prompt_bufnr)
                actions.goto_file_selection_edit:replace(function()
                    local selection = actions.get_selected_entry(prompt_bufnr)
                    actions.close(prompt_bufnr)

                    cb(selection.value)
                end)

                return true
            end,
        })
        :find()
end

local config = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        allow_incremental_sync = true,
    },
}

config.cmd = {
    "/usr/local/opt/openjdk/bin/java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    -- "$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_mac",
    "-data",
    workspace_dir,
}


config.settings = {
    ['java.format.settings.profile'] = "GoogleStyle",
    -- ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
    java = {
        configuration = {
            runtimes = {
                {
                    name = "JavaSE-19",
                    path = "/usr/local/opt/openjdk/",
                },
            },
        },
        signatureHelp = { enabled = true },
        contentProvider = { preferred = "fernflower" },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
                "org.mockito.Mockito.*",
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999,
                staticStarThreshold = 9999,
            },
        },
        codeGeneration = {
            toString = {
                template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            hashCodeEquals = {
                useJava7Objects = true,
            },
            useBlocks = true,
        },
        inlayHints = {
            parameterNames = {
                enabled = false,
            },
        },
    },
}

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

config.init_options = {
    -- bundles = {},
    extendedClientCapabilities = extendedClientCapabilities,
}

config.on_init = function(client, _)
    client.notify("workspace/didChangeConfiguration", { settings = config.settings })
end

jdtls.start_or_attach(config)
