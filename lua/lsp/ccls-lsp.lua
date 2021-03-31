local lspconfig = require('lspconfig')
lspconfig.ccls.setup {
    cmd = { "ccls" },
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            excludeArgs = { "-frounding-math"} ;
        };
    }
}
