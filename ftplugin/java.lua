local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = "." .. project_name

local config = {
    cmd = {
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
        "$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
        "-configuarion",
        "$HOME/.local/share/nvim/mason/packages/jdtls/config_mac/",
        "-data",
        workspace_dir,
    },
    settings = {
        java = {
            runtimes = {
                {
                    name = "JavaSE-17",
                    path = "/usr/local/opt/openjdk",
                },
            },
        },
    },

    init_options = {
        bundles = {},
    },
    root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

require("jdtls").start_or_attach(config)
