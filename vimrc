" General setting
set nocompatible              " be iMproved, required
set laststatus=2
set number
set nobackup
set nowritebackup
set noswapfile
set showcmd
set nowb
set incsearch
set hlsearch
set autoread
set hidden
set autoindent
set smartindent
set ttyfast
set lazyredraw

filetype off                  " required

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-rails'
" Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mkarmona/colorsbox'
Plugin 'christoomey/vim-system-copy'
Plugin 'scrooloose/nerdtree'
Plugin 'w0ng/vim-hybrid'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle "vim-scripts/matchit.zip.git"
Plugin 'flazz/vim-colorschemes'
Bundle "rking/ag.vim"
Bundle "godlygeek/tabular"
" Bundle 'Shougo/neocomplete.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Bundle "vim-scripts/camelcasemotion.git"
Plugin 'qpkorr/vim-bufkill'
Bundle 'chrisgillis/vim-bootstrap3-snippets'
Bundle "vim-scripts/BufOnly.vim"
" Bundle 'scrooloose/syntastic.git'
Bundle "vim-scripts/closetag.vim"
Bundle 'Valloric/YouCompleteMe'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
filetype plugin on    " required
syntax on
syn on

let g:airline_theme='molokai'
let mapleader=","

" set re=1
set cursorline
" set wrap
set nowrap
set linebreak
set nolist
set norelativenumber
set visualbell
set t_Co=256
set background=dark
colorscheme jellybeans

autocmd BufWritePre <buffer> :%s/\s\+$//e

nmap <leader>r :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
" let NERDTreeIgnore = ['tmp', 'log']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeRespectWildIgnore= 1
" let g:NERDTreeWinSize = 30
let NERDTreeShowHidden=1

set wildignore+=*.o,*.obj,.git,tmp,log
set wildmode=list:longest,list:full

" Ctrlp
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$\|log\|tmp"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|log\|tmp'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<CR>

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right>  <C-w>>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {

" autocmd FileType ruby map <buffer> <D-j> ]m
" autocmd FileType ruby map <buffer> <D-k> [m
" autocmd FileType rspec map <buffer> <D-j> }
" autocmd FileType rspec map <buffer> <D-k> {
" autocmd FileType javascript map <buffer> <D-k> }
" autocmd FileType javascript map <buffer> <D-j> {

" via: http://whynotwiki.com/Vim
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" Select text in an ERb file with visual mode and then press s- or s=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"    " -
let g:surround_61 = "<%= \r %>"   " =

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with 'quotes'
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" " neocomplete
" " Next generation completion framework.
"
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_camel_case = 1
" let g:neocomplete#enable_smart_case = 1
"
" " Default # of completions is 100, that's crazy.
" let g:neocomplete#max_list = 5
"
" " Set minimum syntax keyword length.
" let g:neocomplete#auto_completion_start_length = 3
"
" " Map standard Ctrl-N completion to Ctrl-Space
" inoremap <C-Space> <C-n>
"
" " This makes sure we use neocomplete completefunc instead of
" " the one in rails.vim, otherwise this plugin will crap out.
" let g:neocomplete#force_overwrite_completefunc = 1
"
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" camelcasemotion
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e

sunmap W
sunmap B
sunmap E

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" ============================
" Shortcuts for everyday tasks
" ============================

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1

nnoremap <leader>. :CtrlPTag<cr>
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

let g:ruby_path = system('echo $HOME/.rbenv/shims')
