let g:startify_custom_header = [
            \'  _   _                 _           ',
            \' | \ | |               (_)          ',
            \' |  \| | ___  _____   ___ _ __ ___  ',
            \' | . ` |/ _ \/ _ \ \ / / | |_ ` _ \ ',
            \' | |\  |  __/ (_) \ V /| | | | | | |',
            \' |_| \_|\___|\___/ \_/ |_|_| |_| |_|',
            \]

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
