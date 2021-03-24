

-- -- Use K to show documentation in preview window
-- vim.cmd('nnoremap <silent> K :call <SID>show_documentation()<CR>')
-- -- Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
-- -- Coc only does snippet and additional edit on confirm.
-- vim.cmd('inoremap <expr> <cr> pumvisible() ? \"\\<C-y>\" : \"\\<C-g>u\\<CR>\"')

-- vim.cmd([[
-- function! s:show_documentation()
--   if (index(['vim','help'], &filetype) >= 0)
--     execute 'h '.expand('<cword>')
--   elseif (coc#rpc#ready())
--     call CocActionAsync('doHover')
--   else
--     execute '!' . &keywordprg . " " . expand('<cword>')
--   endif
-- endfunction
-- ]])
-- -- Highlight the symbol and its references when holding the cursor
-- vim.cmd('autocmd CursorHold * silent call CocActionAsync(\'highlight\')')

-- -- Use `[g` and `]g` to navigate diagnostics
-- vim.cmd('nmap <silent> [g <Plug>(coc-diagnostic-prev)')
-- vim.cmd('nmap <silent> ]g <Plug>(coc-diagnostic-next)')

-- -- Remap keys for gotos
-- vim.cmd('nmap <silent> gD <Plug>(coc-definition)')
-- vim.cmd('nmap <silent> gY <Plug>(coc-type-definition)')
-- vim.cmd('nmap <silent> gI <Plug>(coc-implementation)')
-- vim.cmd('nmap <silent> gR <Plug>(coc-references)')
-- vim.cmd('autocmd CursorHold * silent call CocActionAsync(\'highlight\')')

-- -- Remap for rename current word
-- vim.cmd('nmap <leader>rn <Plug>(coc-rename)')

-- -- Remap for format selected region
-- vim.cmd('xmap <leader>F  <Plug>(coc-format-selected)')
-- vim.cmd('nmap <leader>F  <Plug>(coc-format-selected)')
-- vim.cmd([[
-- augroup mygroup
--   autocmd!
--   " Setup formatexpr specified filetype(s).
--   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--   " Update signature help on jump placeholder
--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end
-- ]])

-- -- Use `:Format` to format current buffer
-- vim.cmd('command! -nargs=0 Format :call CocAction(\'format\')')
-- -- Use `:Fold` to fold current buffer
-- vim.cmd('command! -nargs=? Fold :call     CocAction(\'fold\', <f-args>)')
-- -- use `:OR` for organize import of current buffer
-- vim.cmd('command! -nargs=0 OR   :call     CocAction(\'runCommand\', \'editor.action.organizeImport\')')

-- -- Add status line support, for integration with other plugin, checkout `:h coc-status`
-- vim.cmd('set statusline^=%{coc#status()}%{get(b:,\'coc_current_function\',\'\')}')
-- vim.cmd([[
-- augroup javascript_folding
--     au!
--     au FileType javascript setlocal foldmethod=syntax
-- augroup END
-- ]])
--
vim.cmd('autocmd FileType json syntax match Comment +\\/\\/.\\+$+')
