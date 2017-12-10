""""""""""""""""""""""""""""
"                          "
"      plugin configs      "
"                          "
""""""""""""""""""""""""""""

" That not only adds merlin to your runtime path, but will always pick the version corresponding to your opam switch without you needing to modify your config
" (assuming you install merlin on each of your switches).
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" manually to update the documentation
" :execute "helptags " . substitute(system('opam config var share'),'\n$','','''') .  "/merlin/vim/doc"

set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim')
    call dein#begin('~/.config/nvim')

    " Let dein manage dein
    " Required
    call dein#add('~/.config/nvim/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here:

    call dein#add('Chiel92/vim-autoformat')

    call dein#add('arcticicestudio/nord-vim')
    call dein#add('liuchengxu/space-vim-dark')

    call dein#add('vim-syntastic/syntastic')

    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    call dein#add('Valloric/YouCompleteMe')

    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')

    " Maintains a history of previous yanks, changes and deletes
    call dein#add('vim-scripts/YankRing.vim')

    " Required
    call dein#end()
    call dein#save_state()
endif

" Required
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

" vim-autoformat
let g:formatters_ml = ['ocp-indent', 'ocamlformat']
let g:formatters_javascript = ['eslint_local']
" have your code be formatted upon saving your file
au BufWrite * :Autoformat

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 0
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" nerdtree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" syntastic
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-airline
let g:airline_theme='deus'

""""""""""""""""""""""""""""
"                          "
"     generaal configs     "
"                          "
""""""""""""""""""""""""""""

" When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim,
" automatically read it again.
set autoread

" use true colors in the terminal
" see more in this gist: https://gist.github.com/XVilka/8346728
set termguicolors
" colorscheme nord
colorscheme space-vim-dark
" If the terminal supports italics, put hi Comment cterm=italic after colorshcme command.
hi Comment cterm=italic

" disable swap file creation
set noswapfile

" providers
" disable python2 support
" let g:loaded_python_provider = 1
" disable ruby support
let g:loaded_ruby_provider = 1

set nu

" Display matches for a search pattern while you type.
set incsearch

" tells Vim to highlight matches with the last used search pattern.
set hlsearch
set ignorecase
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" highlight current line and column
set cursorline
set cursorcolumn

" https://github.com/fatih/vim-go/issues/1236
set completeopt-=preview

set autoread

" 光标移动到 buffer 的顶部和底部时保持 10 行距离
set scrolloff=10

