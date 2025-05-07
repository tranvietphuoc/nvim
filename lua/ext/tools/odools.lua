local M = {}

function M.setup()
    local odools = require("odools")
    local home = os.getenv("HOME") .. "/workspace/odoo"
    odools.setup({
        -- mandatory
        odoo_path = home .. "/src/odoo/",
        python_path = "/usr/bin/python",

        -- optional
        server_path = home .. "/.local/share/nvim/odoo/odoo_ls_server",
        -- addons = { h .. "/src/enterprise/" },
        -- additional_stubs = { h .. "/src/additional_stubs/", h .. "/src/typeshed/stubs" },
        root_dir = home .. "/src/", -- working directory, odoo_path if empty
        settings = {
            autoRefresh = true,
            autoRefreshDelay = nil,
            diagMissingImportLevel = "none",
        },
    })
end

return M
