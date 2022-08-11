local M = {}

function M.setup()
    vim.cmd("let g:tagbar_width = max([30, winwidth(0)/5])")

    vim.api.nvim_set_keymap("n", "<Leader>T", ":TagbarToggle<CR>", { noremap = true, silent = true })

    vim.cmd(
        "let g:tagbar_type_javascript = { 'ctagstype': 'javascript', 'kinds': [ 'a:arrays', 'p:properties', 't:tags', 'o:objects', 'g:generator functions', 'f:functions', 'c:constructors/classes', 'm:methods', 'v:variables', 'i:imports', 'e:exports', 's:styled components' ] }"
    )
    vim.cmd(
        "let g:tagbar_type_go = { 'ctagstype': 'go', 'kinds': [ 'p:package', 'i:imports:1', 'c:constants', 'v:variables', 't:types', 'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor', 'f:functions' ], 'sro': '.', 'kind2scope': { 't': 'ctype', 'n': 'ntype' }, 'scope2kind': { 'ctype': 't', 'ntype': 'n' }, 'ctagsbin': 'gotags', 'ctagsargs': '-sort -silent' }"
    )
    vim.cmd(
        "let g:tagbar_type_rust = { 'ctagstype': 'rust', 'kinds': [ 'T:types,type definitions', 'f:functions, function definitions', 'g:enum,enumeration names', 's:structure names', 'm:modules,module names', 'c:consts,static constants', 't:traits', 'i:impls,trait implementations' ] } "
    )
    vim.cmd("let g:tagbar_type_css = { 'ctagstype': 'Css', 'kinds': [ 'c:classes', 's:selectors', 'i:identities' ] }")
    vim.cmd(
        "let g:tagbar_type_typescript = { 'ctagstype': 'typescript', 'kinds': [ 'c:classes', 'n:modules', 'f:functions', 'v:variables', 'v:varlambdas', 'm:members', 'i:interfaces', 'e:enums' ] }"
    )
    vim.cmd(
        "let g:tagbar_type_markdown = { 'ctagstype': 'markdown', 'kinds': [ 'h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3' ] }"
    )
    vim.cmd(
        "let g:tagbar_type_typescript = { 'ctagstype': 'typescript', 'kinds': [ 'c:classes', 'n:modules', 'f:functions', 'v:variables', 'v:varlambdas', 'm:members', 'i:interfaces', 'e:enums' ] }"
    )
    vim.cmd(
        [[ let g:tagbar_type_json = { 'ctagstype' : 'json', 'kinds' : [ 'o:objects', 'a:arrays', 'n:numbers', 's:strings', 'b:booleans', 'z:nulls' ], 'sro' : '.', 'scope2kind': { 'object': 'o', 'array': 'a', 'number': 'n', 'string': 's', 'boolean': 'b', 'null': 'z' }, 'kind2scope': { 'o': 'object', 'a': 'array', 'n': 'number', 's': 'string', 'b': 'boolean', 'z': 'null' }, 'sort' : 0 } ]]
    )
end

return M
