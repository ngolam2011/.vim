"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
behave mswin

call plug#begin($USERPROFILE.'/vimplugin')
"Plug in
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'mbbill/undotree'
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'tpope/vim-unimpaired'
call plug#end()

"Set up for vim colors pencil
function! s:goyo_enter()
  colorscheme pencil
endfunction

function! s:goyo_leave()
  colorscheme badwolf
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Set up for undotree
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

"Set up for NERDtree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
nmap <F6> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

"Set up for eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"Ignore for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let mapleader=","       " leader is comma
let g:mapleader = ","

" filetype support
set nocompatible
filetype plugin indent on
runtime macros/matchit.vim

" set hidden
set hidden

" set path for finding
set path+=**

"Gundo
"nnoremap <F5> :GundoToggle<CR>

"Set forward slash for window file completation.
set shellslash


syntax on
syntax enable

"set nowrap
"set nowrap
set ai "Auto indent
set si "Smart indent

"Set paper color
"set t_Co=256
"set background=light
"colorscheme PaperColor
"colorscheme base16-default-dark
"set background=dark
"colorscheme hybrid

"Set status line
set number
set laststatus=2
" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"Increase search
set incsearch
"set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"Syntax checking
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

set tabstop=2       " number of visual spaces per TAB
set expandtab       " tabs are spaces
set shiftwidth=2

set showcmd             " show command in bottom bar

"set cursorline          " highlight current line
"hi CursorLine term=reverse ctermbg=8 guibg=DarkGrey

set wildmenu            " visual autocomplete for command menu
set wildmode=full
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

"set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
" space open/closes folds
"nnoremap <space> za
"set foldmethod=indent   " fold based on indent level

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" For regular expressions turn magic on
set magic

" Add a bit extra margin to the left
"set foldcolumn=1


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Be smart when using tabs ;)
set smarttab
" allows cursor change in tmux mode


" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>



" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"Set ignore file and directory
set wildignore+=*/target/*

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
"                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
