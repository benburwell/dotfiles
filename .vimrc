" General Setup

" let's just get this right out of the way, we're gonna be...
set nocompatible

" get the current os for later use
let os = substitute(system('uname'), "\n", "", "")

" UI Settings
syntax enable
set nowrap
if has("termguicolors")
  set termguicolors
endif
set listchars=tab:›\ ,nbsp:_,trail:·
set list
set scrolloff=3

" General file settings
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set incsearch
set hlsearch
set ignorecase
set smartcase
set wildignorecase
set path+=**
set wildmenu
set wildmode=longest,list,full
set foldmethod=syntax
set foldlevelstart=9999

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Quramy/tsuquyomi', {'for' : 'typescript'}
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'Valloric/YouCompleteMe', {'do' : './install.py'}
Plug 'chrisbra/csv.vim', {'for' : 'csv'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', {'for' : 'go'}
Plug 'junegunn/fzf'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'leafgarland/typescript-vim', {'for' : 'typescript'}
Plug 'prettier/vim-prettier', {'do': 'npm install'}
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vito-c/jq.vim'
Plug 'benburwell/blayu.vim'
call plug#end()

" Color scheme
colorscheme blayu

" Filetype-specific configuration and autocommands

" spellcheck markdown files and git commit messages
au FileType markdown set spell tw=80 colorcolumn=81 nosmartindent
au FileType gitcommit set spell

" when writing java code, use javacomplete as the omnifunc and set spacing
au FileType java setlocal omnifunc=javacomplete#Complete
au FileType java setlocal errorformat=[ERROR]\ %f:[%l\\,%v]\ %m

" git-config(1) uses tabs, so we should too
au FileType gitconfig setlocal noexpandtab

" crontab must be edited in place, which is not done by default
" see https://stackoverflow.com/a/21194148
autocmd FileType crontab setlocal nowritebackup

" autoformat on save
augroup fmt
	autocmd!
	autocmd BufWritePre * :undojoin | Neoformat
augroup END

" Plugin Options

" youcompleteme settings
let g:ycm_autoclose_preview_window_after_completion = 1

" fugitive settings
set diffopt+=vertical

" prettier settings
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1

" colorizer settings
let g:colorizer_auto_filetype=''

" neoformat settings
let g:neoformat_java_google = {
	\ 'exe': 'google-java-format',
	\ 'args': ['-'],
	\ 'stdin': 1,
	\ }
let g:neoformat_html_beautify = {
    \ 'exe': 'js-beautify',
    \ 'args': ['--html', '--editorconfig'],
    \ 'stdin': 1,
    \ }
let g:neoformat_enabled_java = ['google']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_sass = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_xml = []
let g:neoformat_enabled_html = ['beautify']
let g:neoformat_enabled_xhtml = []
let g:neoformat_enabled_sql = []

" vim-go settings
let g:go_metalinter_autosave = 1

" Custom keybindings

" double-Esc clears last search
nnoremap <silent> <Esc><Esc> <Esc>:let @/=""<CR><Esc>

" make it easier to type ex commands
noremap ; :

" open FZF with Ctrl-P
nmap <C-p> :FZF<CR>

" easier navigation
"
" this is hacky but some terminals send <BS> instead of <C-h> when ctrl-h is
" pressed. since i don't really use <BS> in normal mode, this seems like a
" reasonable thing for it to do.
nmap <BS> <C-w>h
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <C-q> <C-w>q

" quickly regenerate ctags
if os == "FreeBSD"
	command Ctags !exctags .
else
	command Ctags !ctags .
endif

