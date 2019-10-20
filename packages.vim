" Required
filetype plugin indent on
syntax enable

if has('win32')

    call plug#begin('~\AppData\Local\nvim\plugged')

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'junegunn/goyo.vim'

    Plug 'arcticicestudio/nord-vim'
    Plug 'liuchengxu/space-vim-dark'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'

    Plug 'liuchengxu/vim-which-key'

    " Maintains a history of previous yanks, changes and deletes
    Plug 'vim-scripts/YankRing.vim'

    " ReasonML
    Plug 'reasonml-editor/vim-reason-plus'

    Plug 'sbdchd/neoformat'

    Plug 't9md/vim-choosewin'

    call plug#end()

else 
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

    if dein#load_state('~/.cache/dein')
        call dein#begin('~/.cache/dein')

        " Let dein manage dein
        " Required
        call dein#add('~/.cache/nvim/repos/github.com/Shougo/dein.vim')

        " Add or remove your plugins here:

        " call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
        call dein#add('neoclide/coc.nvim', {'merge':0, 'build': 'yarn install --frozen-lockfile'})

        call dein#add('junegunn/goyo.vim')

        call dein#add('arcticicestudio/nord-vim')
        call dein#add('liuchengxu/space-vim-dark')

        call dein#add('vim-airline/vim-airline')
        call dein#add('vim-airline/vim-airline-themes')

        call dein#add('scrooloose/nerdtree')
        call dein#add('scrooloose/nerdcommenter')

        call dein#add('liuchengxu/vim-which-key')

        " Maintains a history of previous yanks, changes and deletes
        call dein#add('vim-scripts/YankRing.vim')

        " ReasonML
        call dein#add('reasonml-editor/vim-reason-plus')

        call dein#add('sbdchd/neoformat')

        call dein#add('t9md/vim-choosewin')

        " Required
        call dein#end()
        call dein#save_state()
    endif

    " If you want to install not installed plugins on startup.
    if dein#check_install()
        call dein#install()
    endif
endif

