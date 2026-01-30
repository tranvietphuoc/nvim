local function setup()
    local metals_config = require("metals").bare_config()
    local metals = require("metals")
    local cmp_nvim_lsp = require("cmp_nvim_lsp") -- completion
    local dap = require("dap")

    metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }

    metals_config.capabilities = cmp_nvim_lsp.default_capabilities()

    metals_config.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {
                prefix = "●", -- Could be '●', '▎', 'x'
            },
        })

    -- scala debugger
    dap.configurations.scala = {
        {
            type = "scala",
            request = "launch",
            name = "RunOrTest",
            metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
            },
        },
        {
            type = "scala",
            request = "launch",
            name = "Test Target",
            metals = {
                runType = "testTarget",
            },
        },
    }

    metals_config.on_attach = function(client, bufnr)
        require("lsp").common_on_attach(client, bufnr)
        metals.setup_dap()
    end

    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

    vim.api.nvim_create_autocmd("FileType", {
        -- NOTE: You may or may not want java included here. You will need it if you
        -- want basic Java support but it may also conflict if you are using
        -- something like nvim-jdtls which also works on a java filetype autocmd.
        pattern = { "scala", "sbt" },
        callback = function()
            metals.initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
    })
end

return {
    setup = setup,
}
