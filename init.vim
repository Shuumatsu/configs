" disable python2 support
let g:loaded_python_provider = 0
" disable ruby support
let g:loaded_ruby_provider = 0

""""""""""""""""""""""""""""
"                          "
"    package management    "
"                          "
""""""""""""""""""""""""""""

if has('win32')
    call plug#begin('~\AppData\Local\nvim\plugged')
else 
    call plug#begin('~/.vim/plugged')
endif
    
    Plug 'vhdirk/vim-cmake'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'junegunn/goyo.vim'

    Plug 'arcticicestudio/nord-vim'
    Plug 'liuchengxu/space-vim-dark'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'

    " Maintains a history of previous yanks, changes and deletes
    Plug 'vim-scripts/YankRing.vim'

    " ReasonML
    Plug 'reasonml-editor/vim-reason-plus'

    Plug 'sbdchd/neoformat'

    Plug 't9md/vim-choosewin'

    Plug 'voldikss/vim-floaterm'

call plug#end()

""""""""""""""""""""""""""""
"                          "
"      plugin configs      "
"                          "
""""""""""""""""""""""""""""

" coc.vim
set hidden
set nobackup
set nowritebackup
set updatetime=300

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
          let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" :
      \ <SID>check_back_space() ? "\<S-Tab>" :
      \ coc#refresh()

" enable highlight current symbol on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
map <F2> <Plug>(coc-rename)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" neoformat
let g:neoformat_enabled_ocaml = ['ocamlformat']
map <F3> :Neoformat <CR>

" vim-choosewin
" invoke with '-'
nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1

" goyo

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
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open NERDTree with Ctrl+t
map <C-t> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-b> :NERDTreeToggle<CR>

" vim-airline
let g:airline_theme='deus'


" vim-floaterm 
noremap  <silent> <F12>           :FloatermToggle<CR>i
noremap! <silent> <F12>           <Esc>:FloatermToggle<CR>i
tnoremap <silent> <F12>           <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_position = "center"

""""""""""""""""""""""""""""
"                          "
"     general configs     "
"                          "
""""""""""""""""""""""""""""

if exists('veonim')
    let g:vscode_extensions = [
        \'esbenp.prettier-vscode',
        \'vscode.typescript-language-features',
        \'vscode.css-language-features',
        \'vscode.html-language-features',
        \'vscode.markdown-language-features',
    \]
    let g:vscode_config = {
    \}
    set guifont=iosevka:h16
else
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
endif

" use true colors in the terminal
" see more in this gist: https://gist.github.com/XVilka/8346728
set termguicolors
" colorscheme nord
" colorscheme space-vim-dark
if has("win32")
    colorscheme space-vim-dark
else
    source ~/.config/nvim/color-veonim.vim"
endif
" If the terminal supports italics, put hi Comment cterm=italic after colorshcme command.
hi Comment cterm=italic

" get correct comment highlighting in json
autocmd FileType json syntax match Comment +\/\/.\+$+

" When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim,
" automatically read it again.
set autoread

" disable swap file creation
set noswapfile

set nu

set autoread

" 光标移动到 buffer 的顶部和底部时保持 10 行距离
set scrolloff=10
