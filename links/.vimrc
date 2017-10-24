" General Setup {{{

" let's just get this right out of the way, we're gonna be...
set nocompatible

" get the current os for later use
let os = substitute(system('uname'), "\n", "", "")

"}}}

" UI Settings {{{
syntax enable
set relativenumber
set number
set cursorline
set nowrap
if has("termguicolors")
  set termguicolors
endif
set listchars=tab:›\ ,nbsp:_,trail:·
set list
set scrolloff=5
"}}}

" General file settings {{{
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

set incsearch
set hlsearch
set ignorecase
set smartcase
set wildignorecase
set path+=**
set wildmenu
set wildmode=longest,list,full
set foldmethod=syntax
set foldlevelstart=1
"}}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'Quramy/tsuquyomi', {'for' : 'typescript'}
Plug 'Shougo/vimproc', {'do' : 'make'}
Plug 'Valloric/YouCompleteMe', {'do' : './install.py'}
Plug 'airblade/vim-gitgutter'
"Plug 'chauncey-garrett/vim-colorizer'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'chrisbra/csv.vim', {'for' : 'csv'}
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go', {'for' : 'go'}
Plug 'junegunn/fzf'
Plug 'leafgarland/typescript-vim', {'for' : 'typescript'}
Plug 'majutsushi/tagbar'
Plug 'sbdchd/neoformat'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/loremipsum'
Plug 'vito-c/jq.vim', {'for' : 'jq'}
Plug 'whatyouhide/vim-gotham'
call plug#end()
"}}}

" Color scheme {{{
colorscheme gotham
"}}}

" Filetype-specific configuration and autocommands {{{

" spellcheck markdown files
au FileType markdown set spell expandtab wrap tw=80 colorcolumn=81
au FileType gitcommit set spell
au FileType java setlocal omnifunc=javacomplete#Complete expandtab shiftwidth=2

" close folds in vimrc by default
au BufEnter ~/.vimrc set foldmethod=marker foldlevel=0

" autoformat on save
augroup fmt
	autocmd!
	autocmd BufWritePre * :undojoin | Neoformat
augroup END
"}}}

" Plugin Options {{{

" gitgutter settings {{{
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 3000
"}}}

" fugitive settings {{{
set diffopt+=vertical
"}}}

" auto complete popup settings {{{
"let g:acp_completeOption = '.,w,b,u,t,kspell'
"}}}

" prettier settings {{{
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#semi = 'false'
"}}}

" colorizer settings {{{
let g:colorizer_auto_filetype=''
"}}}

" tagbar settings {{{
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
"}}}

" neoformat settings {{{
let g:neoformat_java_google = {
	\ 'exe': 'java',
	\ 'args': ['-jar ~/.bin/google-java-format-1.4-all-deps.jar -'],
	\ 'stdin': 1,
	\ }
let g:neoformat_enabled_java = ['google']
let g:neoformat_enabled_javascript = []
let g:neoformat_enabled_typescript = []
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_sass = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_xml = []
let g:neoformat_enabled_html = []
let g:neoformat_enabled_xhtml = []
"}}}

" netrw settings {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"}}}

"}}}

" Custom keybindings {{{

" when the auto competion popup is visible, remap so that the
" tab key executes the competion
inoremap <expr> <Tab> pumvisible() ? "\<C-Y>" : "\<Tab>"

" make { insert a closing }
inoremap {<CR> {<CR>}<Esc>ko

" double-Esc clears last search
nnoremap <silent> <Esc><Esc> <Esc>:let @/=""<CR><Esc>

" make it easier to type ex commands
noremap ; :

" make n / N center the find on the screen
nmap n nzz
nmap N Nzz

" quickly jump center with <space>
nmap <Space> zz

" always do a global tag search
nmap <C-]> g<C-]>

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
"}}}

" Custom commands {{{

" quickly regenerate ctags
if os == "FreeBSD"
	command Ctags !exctags .
else
	command Ctags !ctags .
endif
"}}}

" Snippets {{{
nnoremap <leader>html :-1read ~/.dotfiles/snippets/doc.html<CR>4j3wli
nnoremap <leader>cls :-1read ~/.dotfiles/snippets/apexclass.cls<CR>wwhi
nnoremap <leader>atst :-1read ~/.dotfiles/snippets/apextest.cls<CR>jwwhi
"}}}
