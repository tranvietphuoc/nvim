local on_attach = function(client, bufnr)
    require("jdtls").setup_dap()
    require("lsp").common_on_attach(client, bufnr)

    local function map(...)
        vim.keymap.set(...)
    end

    local opts = { noremap = true, silent = true, buffer = bufnr }

    map("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
    map("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
    map("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
    map("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
    map("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
    map("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
end

local jdtls = require("jdtls")
jdtls.settings.jdt_uri_timeout_ms = 1000

local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls/"
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml" }

local os_config
if vim.fn.has("macunix") == 1 then
    os_config = "mac"
elseif vim.fn.has("win32") == 1 then
    os_config = "win"
elseif vim.fn.has("unix") == 1 then
    os_config = "linux"
else
    os_config = "linux"
end

local root_dir = require("jdtls.setup").find_root(root_markers)
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_path = vim.fn.stdpath("data") .. "/site/java/workspaces/" .. project_name

vim.fn.mkdir(workspace_path, "p")

local lombok_path = jdtls_path .. "lombok.jar"

local capabilities = require("lsp").capabilities()
capabilities.workspace = {
    configuration = true,
}

capabilities.textDocument = {
    completion = {
        completionItem = {
            snippetSupport = true,
            resolveSupport = {
                properties = {
                    "documentation",
                    "detail",
                    "additionalTextEdits",
                },
            },
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
    autostart = true,
    filetypes = { "java" },
    capabilities = capabilities,
    single_file_support = true,
    on_attach = on_attach,
    flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
    },

    root_dir = root_dir,

    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "-javaagent:" .. lombok_path,
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",

        "-jar",
        vim.fn.glob(jdtls_path .. "plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        jdtls_path .. "config_" .. os_config .. "/",
        "-data",
        workspace_path,
    },

    settings = {
        ["java.format.settings.profile"] = "GoogleStyle",
        -- ["java.format.settings.url"] = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
        --
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk",
                    },
                    {
                        name = "JavaSE-21",
                        path = "/usr/lib/jvm/java-21-graalvm",
                    },
                },
            },
            eclipse = {
                downloadSources = true,
            },
            maven = {
                downloadSources = true,
            },
            gradle = {
                enabled = true,
            },
            updateBuildConfiguration = "interactive",
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "cfr" },
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
                useBlocks = true,
            },
            inlayHints = {
                parameterNames = {
                    enabled = "all",
                    exclusions = { "this" },
                },
            },
        },
    },

    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
        bundles = {
            vim.fn.glob(
                vim.fn.stdpath("data")
                    .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
                1
            ),
        },
    },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.java" },
    callback = function()
        local _, _ = pcall(vim.lsp.codelens.refresh)
    end,
})

jdtls.start_or_attach(config)
