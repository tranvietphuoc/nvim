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
    vim.lsp.config("pyright", {
        cmd = { DATA .. "/mason/bin/pyright-langserver", "--stdio" },
        on_attach = M.python_attach,
        handlers = lsputils.lsp_diagnostics(),
        root_dir = function(bufnr, on_dir)
            -- lấy tên file từ buffer nếu arg là số
            local fname = vim.api.nvim_buf_get_name(bufnr)
            if fname == nil or fname == "" then
                -- có thể fallback
                return
            end
            -- các markers bạn muốn tìm
            local markers = { "odoo", ".git", ".venv" }
            -- sử dụng vim.fs.find để tìm markers
            local found = vim.fs.find(markers, { upward = true, path = fname })
            if found and #found > 0 then
                -- trả dir của file marker đầu tiên
                on_dir(vim.fs.dirname(found[1]))
            else
                -- fallback: thư mục của file hiện tại
                on_dir(vim.fn.fnamemodify(fname, ":p:h"))
            end
        end,
        on_init = function(client)
            local root_dir = client.config.root_dir or "" -- đảm bảo không nil
            local extra_paths = find_extra_paths(root_dir)
            client.config.settings = client.config.settings or {}
            client.config.settings.python = {
                pythonPath = M._python_path(root_dir),
                analysis = {
                    ignore = { "*" },
                    extraPaths = extra_paths,
                    typeCheckingMode = "off",
                    autoSearchPaths = false,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    autoImportUserSymbols = true,
                    autoImportCompletions = true,
                    importFormat = "relative",
                    stubPath = tostring(Path:new(root_dir, "stubs/odoo-stubs16")),
                },
            }
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end,
        settings = {
            pyright = {
                disableOrganizeImports = true,
            },
        },
        single_file_support = true,
    })
    vim.lsp.enable("pyright")

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
