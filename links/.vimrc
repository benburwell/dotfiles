set nocompatible

" get the current os for later use
let os = substitute(system('uname'), "\n", "", "")

" UI settings
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

" General file settings
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

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'chrisbra/csv.vim'
Plugin 'vito-c/jq.vim'
Plugin 'ssh://git@gitserver.trifecta.com/salesforce-vim.git'
Plugin 'whatyouhide/vim-gotham'
Plugin 'majutsushi/tagbar'
Plugin 'leafgarland/typescript-vim'
call vundle#end()
filetype plugin indent on

colorscheme gotham

" config files that get specific types/syntax
au BufEnter ~/.sf/config set ft=json

" various syntaxes from plugins
"au BufEnter *.coffee set ft=coffee
"au BufEnter *.jq set ft=jq

" spellcheck markdown files
au FileType markdown set spell expandtab wrap tw=80 colorcolumn=81
au FileType gitcommit set spell

" gitgutter settings
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 3000

" fugitive settings
set diffopt+=vertical

" auto complete popup settings
let g:acp_completeOption = '.,w,b,u,t,kspell'

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

" quickly regenerate ctags
if os == "FreeBSD"
	command Ctags !exctags .
else
	command Ctags !ctags .
endif

nnoremap <leader>html :-1read ~/.dotfiles/snippets/doc.html<CR>4j3wli
nnoremap <leader>cls :-1read ~/.dotfiles/snippets/apexclass.cls<CR>wwhi
nnoremap <leader>atst :-1read ~/.dotfiles/snippets/apextest.cls<CR>jwwhi
