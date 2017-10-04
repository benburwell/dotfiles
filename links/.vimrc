""" GENERAL SETUP

" let's just get this right out of the way, we're gonna be...
set nocompatible

" get the current os for later use
let os = substitute(system('uname'), "\n", "", "")

""" UI SETTINGS
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
set scrolloff=3

""" GENERAL FILE SETTINGS
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

""" VUNDLE PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/Colorizer'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'chrisbra/csv.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'prettier/vim-prettier'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'vim-scripts/loremipsum'
Plugin 'vito-c/jq.vim'
Plugin 'whatyouhide/vim-gotham'
call vundle#end()
filetype plugin indent on

""" COLOR SCHEME
colorscheme gotham

""" FILETYPE-SPECIFIC ADDITIONAL CONFIGURATION

" spellcheck markdown files
au FileType markdown set spell expandtab wrap tw=80 colorcolumn=81
au FileType gitcommit set spell
au FileType java setlocal omnifunc=javacomplete#Complete expandtab shiftwidth=2

""" PLUGIN OPTIONS

" gitgutter settings
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 3000

" fugitive settings
set diffopt+=vertical

" auto complete popup settings
"let g:acp_completeOption = '.,w,b,u,t,kspell'

" colorizer options
let g:colorizer_auto_filetype='css,scss,html,typescript'

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

" prettier settings
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'all'

""" CUSTOM KEYBINDINGS

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

""" CUSTOM COMMANDS

" quickly regenerate ctags
if os == "FreeBSD"
	command Ctags !exctags .
else
	command Ctags !ctags .
endif

""" SNIPPETS
nnoremap <leader>html :-1read ~/.dotfiles/snippets/doc.html<CR>4j3wli
nnoremap <leader>cls :-1read ~/.dotfiles/snippets/apexclass.cls<CR>wwhi
nnoremap <leader>atst :-1read ~/.dotfiles/snippets/apextest.cls<CR>jwwhi

command GoogleJavaFormat w | !java -jar ~/.bin/google-java-format-1.4-all-deps.jar --replace %:p

