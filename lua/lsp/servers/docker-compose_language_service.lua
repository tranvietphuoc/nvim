local function setup()
    vim.lsp.config("docker_compose_language_service", {
        cmd = { DATA .. "/mason/bin/docker-compose-langserver", "--stdio" },
        on_attach = require("lsp").common_on_attach,
        filetypes = { "yaml.docker-compose" },
        root_dir = vim.fs.dirname(vim.fs.find({ "docker-compose.yaml" }, { upward = true })[1]),
        single_file_support = true,
    })
end

return {
    setup = setup,
}
