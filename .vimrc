" ----------------------
"  GENERAL
" ----------------------
call plug#begin('~/.vim/plugged')

" allow clipboard
set clipboard=unnamed

" custom leader
let mapleader = ","

" Enable Filetype plugins
filetype on
filetype plugin on
filetype indent on

" set autoread, so changes from outside are read
set autoread

" Let's Get WILD(mode)
set wildmode=list:full

" cmd bar height
set cmdheight=2

" ignore case when searching & highlight results
set ignorecase
set smartcase
set hlsearch
set incsearch

" regex magic 
set magic


" ----------------------
"  BUFFERS
" ----------------------

" switch to last used buffer
nnoremap <Leader>l :b#<CR>


" ----------------------
"  UI
" ----------------------

set t_Co=256

" Don't redraw while executing macros (good performance config)
set lazyredraw

" clear highlighted text on esc
nnoremap <silent> <esc> :noh<cr><esc>

" turn off error notifiers
set noerrorbells
set novisualbell

" SYNTAX & UI
syntax on
syntax enable
set number

set splitbelow " more natural splits
set splitright

" highlight brackets
set showmatch
hi MatchParen cterm=underline ctermbg=none ctermfg=blue
hi Search cterm=none ctermfg=black ctermbg=yellow


" Rainbow Parentheses
Plug 'kien/rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ----------------------
"  FILES
" ----------------------

set encoding=utf8
set ffs=unix,dos,mac
set nobackup " no backpus
set nowb
set noswapfile
set hidden


" ----------------------
"  TEXT EDITING
" ----------------------
set expandtab " spaces instead of tabs
set smarttab
set shiftwidth=4
set tabstop=4

set scrolloff=3

set lbr
set tw=400 " linebreak after 400 chars

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



" ----------------------
"  MAPS
" ----------------------

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-h> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>


" autocomplete on tab
imap <C-Tab> <C-P>
set complete=.,b,u,] " pull autocomplete from all sources (files, buffers, tags)



" ----------------------
"  TOOLS
" ----------------------
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'

Plug 'Raimondi/delimitMate' 
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1

" ----------------------
"  GIT
" ----------------------
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'



" ----------------------
"  LANGUAGES
" ----------------------

Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>'

" Markdown
Plug 'plasticboy/vim-markdown', { 'for': ['markdown', 'latex'] }
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.md hi link mkdLineBreak Underlined
let g:vim_markdown_folding_disabled=1

Plug 'scrooloose/syntastic'
let g:syntastic_javascripts_checkers = ['jshint']
let g:syntastic_aggregate_errors=1
let g:syntastic_html_checkers = []

" find nearest .jshintrc from https://github.com/rlipscombe/vimrc/blob/master/vimrc#L174
function! s:find_jshintrc(dir)
    let l:found = globpath(a:dir, '.jshintrc')
    if filereadable(l:found)
        return l:found
    endif

    let l:parent = fnamemodify(a:dir, ':h')
    if l:parent != a:dir
        return s:find_jshintrc(l:parent)
    endif

    return "~/.jshintrc"
endfunction

function! UpdateJsHintConf()
    let l:dir = expand('%:p:h')
    let l:jshintrc = s:find_jshintrc(l:dir)
"    let g:syntastic_javascript_jshint_conf = l:jshintrc
    let g:syntastic_javascript_jshint_args = '-c ' + l:jshintrc
endfunction

au BufEnter * call UpdateJsHintConf()
let g:syntastic_always_populate_loc_list=1
let g:syntastic_debug = 0 

Plug 'mustache/vim-mustache-handlebars', { 'for': ['handlebars', 'html'] }


Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript'] }

Plug 'chriskempson/base16-vim'

call plug#end()




" ----------------------
"  COLOURSCHEME (here because of plugin loading)
" ----------------------
set background=dark
colorscheme base16-ocean
set laststatus=2
hi User1 ctermbg=08 ctermfg=white
hi User2 ctermbg=08 ctermfg=blue
set statusline=%1*\ \ %F%m\ %2*%y%=%1*%l:%c\ %2*%P\ \ 



" ----------------------
"  HELPER FUNCTIONS
" ----------------------

" Auto reload .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" for testing colourschemes/highlighting
"map <Leader>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
""\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
