local lsputils = require("lsp.utils")
local Path = require("plenary.path")

local function get_root(fname)
    if not fname or fname == "" or type(fname) == "number" then
        return vim.fn.getcwd()
    end

    -- Ensure we have an absolute path
    if not vim.startswith(fname, "/") then
        fname = vim.fn.fnamemodify(fname, ":p")
    end

    local path = vim.fs.dirname(fname)
    local root = vim.fs.find({ "pyproject.toml", "requirements.txt", ".git", "uv.lock" }, { upward = true, path = path })[1]
    if root then
        return vim.fs.dirname(root)
    end

    -- Fallback to file's directory instead of cwd
    return path or vim.fn.getcwd()
end

local function find_extra_paths(root_dir)
    local root_path = Path:new(root_dir)
    return {
        tostring(root_path),
        tostring(root_path:joinpath("odoo")),
        tostring(root_path:joinpath("odoo/addons")),
        tostring(root_path:joinpath("my_addons")),
        tostring(root_path:joinpath("abenla-erp/custom-addons")),
    }
end

local function _python_path(dir)
    if not dir then dir = vim.fn.getcwd() end
    local venv_python = dir .. "/.venv/bin/python"
    if vim.fn.executable(venv_python) == 1 then
        return venv_python
    end
    return vim.fn.exepath("python3") or "python"
end

local function setup()
    local capabilities = require("lsp").capabilities and require("lsp").capabilities() or vim.lsp.protocol.make_client_capabilities()

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(ev)
            -- Get the file path from buffer name instead of ev.file
            local bufname = vim.api.nvim_buf_get_name(ev.buf)
            if bufname == "" then
                bufname = vim.fn.getcwd()
            end

            local root_dir = get_root(bufname)

            -- Ensure root_dir is absolute path
            if not vim.startswith(root_dir, "/") then
                root_dir = vim.fn.fnamemodify(root_dir, ":p"):gsub("/$", "")
            end

            -- Configuration for pyrefly
            local pyrefly_cmd = vim.fn.stdpath("data") .. "/mason/bin/pyrefly"
            if vim.fn.executable(pyrefly_cmd) ~= 1 then
                 pyrefly_cmd = "pyrefly" -- fallback to path
            end

            local pyrefly_client_id = vim.lsp.start({
                name = "pyrefly",
                cmd = { pyrefly_cmd, "lsp" },
                root_dir = root_dir,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            stubPath = "typings",
                            autoImportCompletions = true,
                        },
                    },
                },
                on_init = function(client)
                     local function is_odoo_env(dir)
                         return Path:new(dir):joinpath(".venv"):exists()
                     end

                     local import_strategy = is_odoo_env(root_dir) and "fromEnvironment" or "useBundled"
                     local extra_paths = find_extra_paths(root_dir)
                     local python_path = _python_path(root_dir)
                     
                     if not client.config.settings.python then client.config.settings.python = {} end
                     if not client.config.settings.python.analysis then client.config.settings.python.analysis = {} end

                     client.config.settings.python.analysis.pythonInterpreterPath = python_path
                     client.config.settings.python.analysis.importStrategy = import_strategy
                     client.config.settings.python.analysis.searchPaths = extra_paths
                     
                     client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                     return true
                end,
                on_attach = function(client, bufnr)
                    require("lsp").common_on_attach(client, bufnr)
                    -- Explicitly enable inlay hints if supported
                    if client.server_capabilities.inlayHintProvider then
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end
                end,
                capabilities = capabilities,
            }, { 
                bufnr = ev.buf,
                reuse_client = function(client, conf)
                    return client.name == conf.name and client.config.root_dir == conf.root_dir
                end
            })

            if not pyrefly_client_id then
                vim.notify("Failed to start pyrefly", vim.log.levels.ERROR)
            end

            -- Configuration for ruff
            local ruff_cmd = vim.fn.stdpath("data") .. "/mason/bin/ruff"
            if vim.fn.executable(ruff_cmd) ~= 1 then
                ruff_cmd = "ruff"
            end

            local ruff_client_id = vim.lsp.start({
                name = "ruff",
                cmd = { ruff_cmd, "server", "--preview" },
                root_dir = root_dir,
                on_attach = function(client, bufnr)
                    if client.name == "ruff" then
                        -- Disable hover from ruff in favor of pyrefly
                        client.server_capabilities.hoverProvider = false
                    end
                    require("lsp").common_on_attach(client, bufnr)
                end,
                capabilities = capabilities,
            }, {
                bufnr = ev.buf,
                reuse_client = function(client, conf)
                    return client.name == conf.name and client.config.root_dir == conf.root_dir
                end
            })
            
             if not ruff_client_id then
                vim.notify("Failed to start ruff", vim.log.levels.ERROR)
            end
        end,
    })
end

return {
    _python_path = _python_path,
    setup = setup,
}
