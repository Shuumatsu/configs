set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'fatih/vim-go'

" Scala
" Plugin 'ensime/ensime-vim'
" for Scala filetype detection and highlighting.
" Plugin 'derekwyatt/vim-scala'

" Haskell
Plugin 'neovimhaskell/haskell-vim'

" dracula color scheme
Plugin 'dracula/vim'
" Material color scheme for Vim based on w0ng/vim-hybrid color scheme.
Plugin 'kristijanhusak/vim-hybrid-material'
" Material theme for vim
Plugin 'jdkanani/vim-material-theme'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'

Plugin 'scrooloose/nerdcommenter'

Plugin 'scrooloose/syntastic'

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-surround'

Plugin 'raimondi/delimitmate'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'sbdchd/neoformat'

" Plugin 'terryma/vim-multiple-cursors'

call vundle#end()            " required
" This switches on three very clever mechanisms:
" 1. Filetype detection.
" 2. Using filetype plugin files
" 3. Using indent files
filetype plugin indent on    " required

" airline
let g:airline_theme='base16'

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Synstastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'gofmt']
let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_scala_checkers = ['scalastyle']

" Neoformat
let g:neoformat_enabled_haskell = ['stylish-haskell', 'hindent']
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_enabled_go = ['goimports', 'gofmt']
" let g:neoformat_enabled_scala = ['scalafmt']
let g:neoformat_enabled_css = ['prettier', 'js-beautify']
noremap <F3> :Neoformat <CR>
" format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * Neoformat
augroup END

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" ensime
" autocmd BufWritePost *.scala silent :EnTypeCheck

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
" use neoformat
let g:haskell_indent_disable = 1


"""""""""""""""""""
"                 "
" general configs "
"                 "
"""""""""""""""""""


" use true colors in the terminal
" see more in this gist: https://gist.github.com/XVilka/8346728
set termguicolors

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

syntax on
color dracula
hi SpellCap guisp=#66BB6A
:hi SpellCap guisp=#66BB6A

" tells Vim to highlight matches with the last used search pattern.
set hlsearch
set ignorecase
set incsearch

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"被分割窗口之间显示空白
" set fillchars=vert:/
" set fillchars=stl:/
" set fillchars=stlnc:/

" highlight current line and column
set cursorline
set cursorcolumn

" https://github.com/fatih/vim-go/issues/1236
set completeopt-=preview
