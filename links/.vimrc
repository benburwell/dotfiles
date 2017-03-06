set nocompatible
filetype off
syntax enable
set number

set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrap
set cursorline
set wildignorecase

if has("termguicolors")
  set termguicolors
endif

set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set listchars=tab:›\ ,nbsp:_,trail:·,eol:¬
set list

set wildmode=longest,list,full

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kchmck/vim-coffee-script'
"Plugin 'benburwell/vim-syntax-apex'
Plugin 'neowit/vim-force.com'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'chrisbra/csv.vim'
Plugin 'vito-c/jq.vim'

" colorschemes i like
"Plugin 'sickill/vim-monokai'
"Plugin 'vim-scripts/lilypink'
"Plugin 'mtglsk/mushroom'
"Plugin 'benburwell/vim-colorscheme-benji'
"Plugin 'roosta/vim-srcery'
Plugin 'whatyouhide/vim-gotham'

call vundle#end()
filetype plugin indent on

colorscheme gotham

au BufEnter *.cls set syntax=apex noexpandtab
au BufEnter *.trigger set syntax=apex noexpandtab
au BufEnter *.page set syntax=xml noexpandtab
au BufEnter *.component set syntax=xml noexpandtab
au BufEnter *.email set syntax=xml noexpandtab
au BufEnter *.cmp set syntax=xml noexpandtab
au BufEnter *.evt set syntax=xml noexpandtab
au BufEnter *.app set syntax=xml noexpandtab
au BufEnter .sfconfig set syntax=json
au BufEnter *.coffee set ft=coffee
au BufEnter ~/.sf/config set ft=json
au BufEnter *.csv set ft=csv
au BufEnter *.jq set ft=jq
au FileType markdown set spell

" gitgutter settings
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 3000

" Ctrl-P settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag --ignore ".git/" %s -l --nocolor --hidden -g ""'

" fugitive settings
set diffopt+=vertical

" when the auto competion popup is visible, remap so that the
" tab key executes the competion
inoremap <expr> <Tab> pumvisible() ? "\<C-Y>" : "\<Tab>"

" make { insert a closing }
inoremap {<CR> {<CR>}<Esc>ko

" double-Esc clears last search
nnoremap <silent> <Esc><Esc> <Esc>:let @/=""<CR><Esc>

nnoremap ; :

" make n / N center the find on the screen
nmap n nzz
nmap N Nzz

" quickly jump center with <space>
nmap <Space> zz

" open NERDtree
nmap <leader>n :NERDTree<cr>
