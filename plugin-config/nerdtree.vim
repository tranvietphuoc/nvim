" setup nerdtree
" nerdtree finding the right file
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
" closing automatically
let NERDTreeQuitOnOpen = 1
autocmd bufenter * if (winnr("$")) == 1 && exists("b:NERDTreeType") && (b:NERDTreeType == "primary") | q | endif
" deleting files
let NERDTreeAutoDeleteBuffer=1
" making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" map leader + o open nerdtree
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3
let g:netrw_localrmdir='rm -r'
" toggle nertree on the left side of the editor
nnoremap <leader>e :Lexplore<CR>
" config nerdtree-color-highlights
let g:NERDTreeFileExtensionHighlightFullName = 1
" config nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeShowGitStatus=1
let g:NERDTreeShowHidden=1  " Show hidden files
let g:NERDTreeWinSize=30  " size of NERDTree windows
let NERDTreeIgnore = ['\.swp$', '.DS_Store', '\.pyc$', '__pycache__', 'node_modules']  " filter VIM swap-files from tree
" Highlighting insdide NERDTree
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeSyntaxEnabledExtensions=[
	\'c',
	\'css',
	\'h',
	\'html',
	\'jpg',
	\'js',
    \'jsx',
	\'json',
	\'lock',
	\'md',
	\'php',
	\'cpp',
	\'py',
	\'sass',
	\'vue',
    \'scss',
    \'rs',
    \'go',
    \'ts',
    \'elm',
    \'sql',
    \'vim',
    \'db',
    \'sh',
    \'cs',
    \'rb',
    \'xml',
    \'rst',
\]
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
'
