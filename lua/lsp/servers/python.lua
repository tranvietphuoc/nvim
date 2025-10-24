local lsputils = require("lsp.utils")
local Path = require("plenary.path")

local M = {}

local function find_extra_paths(root_dir)
    local root_path = Path:new(root_dir)
    return {
        tostring(root_path),
        tostring(root_path:joinpath("odoo")),
        tostring(root_path:joinpath("my_addons")),
    }
end

function M._python_path(workspace)
    local venv_python = workspace .. "/.venv/bin/python"
    if vim.fn.executable(venv_python) == 1 then
        return venv_python
    end
    return vim.fn.exepath("python3") or "python"
end

function M.python_attach(client, bufnr)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
        callback = function(args)
            local client2 = vim.lsp.get_client_by_id(args.data.client_id)
            if client2 and client2.name == "ruff" then
                client2.server_capabilities.hoverProvider = false
            end
        end,
        desc = "LSP: Disable hover capability from Ruff",
    })
    require("lsp").common_on_attach(client, bufnr)
end

function M.setup()
    vim.lsp.config("pyrefly", {
        cmd = { "uvx", "pyrefly", "lsp" },
        filetypes = { "python" },
        root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            local markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" }
            local found = vim.fs.find(markers, { upward = true, path = fname })
            if found and #found > 0 then
                on_dir(vim.fs.dirname(found[1]))
            else
                on_dir(vim.fn.getcwd())
            end
        end,
        on_init = function(client)
            local root_dir = client.config.root_dir or vim.fn.getcwd()
            local extra_paths = find_extra_paths(root_dir)
            client.config.settings = client.config.settings or {}
            client.config.settings.python = client.config.settings.python or {}
            client.config.settings.python.analysis = client.config.settings.python.analysis or {}
            client.config.settings.python.analysis.searchPaths = extra_paths

            -- gửi config mới cho server
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end,
        on_attach = function(client, bufnr)
            require("lsp").common_on_attach(client, bufnr)
            -- kích hoạt semantic tokens
            -- Inlay hints (nếu bạn bật)
            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end

            -- Semantic tokens (API mới của Neovim)
            if client.server_capabilities.semanticTokensProvider then
                vim.lsp.semantic_tokens.start(bufnr, client.id)

                -- tuỳ chọn: refresh khi cần
                vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter", "TextChanged" }, {
                    buffer = bufnr,
                    callback = function()
                        pcall(vim.lsp.semantic_tokens.refresh, bufnr)
                    end,
                })
            end
        end,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    importStrategy = "fromEnvironment",
                    stubPath = "typings",
                    -- searchPaths = find_extra_paths(),
                },
            },
        },
    })

    vim.lsp.enable({ "pyrefly" })

    vim.lsp.config("ruff", {
        on_attach = M.python_attach,
        filetypes = { "python" },
        init_options = {
            settings = {
                organizeImports = true,
                showSyntaxErrors = true,
                lint = {
                    enable = true,
                    args = { "--select=ARG,E,F,E501", "--ignore=E4,E7,F401" },
                },
                format = {
                    preview = true,
                    args = { "--config", "./pyproject.toml" },
                },
                codeAction = {
                    disableRuleComment = { enable = false },
                    fixViolation = { enable = true },
                },
                logLevel = "debug",
            },
        },
    })
    vim.lsp.enable("ruff")
end

return M
