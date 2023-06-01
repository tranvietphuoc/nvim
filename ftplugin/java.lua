local on_attach = function(client, bufnr)
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap()
    require("lsp-status").register_progress()
    require("lspsaga").setup()
    require("lsp").common_on_attach(client, bufnr)

    local function map(...)
        vim.keymap.set(...)
    end

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Java specific
    map("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    map("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    map("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local jdtls = require("jdtls")
jdtls.settings.jdt_uri_timeout_ms = 10000

local home = os.getenv("HOME")
local jdtls_dir = home .. "/.local/share/nvim/mason/packages/jdtls/"
local root_markers = { "gradlew", "pom.xml", ".git", "mvnw", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workplace = "/Desktop/learning/java/"
local workspace_folder = home .. workplace .. project_name

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace = {
    configuration = true,
}

capabilities.textDocument = {
    completion = {
        completionItem = {
            snippetSupport = true,
        },
    },

    codeaction = {
        dynamicregistration = false,
        codeactionliteralsupport = {
            codeactionkind = {
                valueset = {
                    "source.generate.tostring",
                    "source.generate.hashcodeequals",
                },
            },
        },
    },
}

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 80,
    },

    cmd = {
        "java",
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

        "-javaagent:" .. jdtls_dir .. "lombok.jar",
        "-jar",
        -- "$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
        vim.fn.glob(jdtls_dir .. "plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        jdtls_dir .. "config_mac/",
        "-data",
        workspace_folder,
    },

    settings = {
        ["java.format.settings.profile"] = "GoogleStyle",
        -- ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
        --
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/usr/local/opt/openjdk@17",
                    },
                },
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
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
                importOrder = {
                    "java",
                    "javax",
                    "com",
                    "org",
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
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
    },

    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
        bundles = {},
    },
}

-- config.handlers["language/status"] = function() end

--[[ config.on_init = function(client, _)
    client.notify("workspace/didChangeConfiguration", { settings = config.settings })
end ]]

jdtls.start_or_attach(config)
