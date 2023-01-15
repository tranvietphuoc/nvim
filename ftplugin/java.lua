local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "." .. project_name

local jdtls = require("jdtls")

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

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local on_attach = function(client, bufnr)
    require("jdtls.setup").add_commands()
    require("jdtls").setup_dap()
end

local config = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
        allow_incremental_sync = true,
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

        "-jar",
        -- "$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        vim.fn.glob(DATA .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6*.jar"),
        "-configuration",
        DATA .. "/mason/packages/jdtls/config_mac",
        "-data",
        workspace_dir,
    },

    -- cmd = { DATA .. "/mason/packages/jdtls/bin/jdtls" },
    settings = {
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
    },

    init_options = {
        bundles = {},
        extendedClientCapabilities = extendedClientCapabilities,
    },
    root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    -- root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls.setup").add_commands()
jdtls.start_or_attach(config)
