set nocompatible
syntax enable
set nowrap
set listchars=tab:›\ ,nbsp:_,trail:·
set list
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set incsearch
set ignorecase
set smartcase
set wildignorecase
set path+=**
set wildmenu
set wildmode=longest,list,full
set suffixesadd=.js,.ts
set hlsearch

call plug#begin('~/.local/share/nvim/plugged')
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim', {'for' : 'csv'}
Plug 'chrisbra/Colorizer'
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', {'for' : 'go'}
Plug 'junegunn/fzf'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'leafgarland/typescript-vim', {'for' : 'typescript'}
Plug 'mhinz/vim-rfc'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'vito-c/jq.vim'
call plug#end()

au FileType markdown setlocal spell tw=80 colorcolumn=81 nosmartindent
au FileType gitcommit setlocal spell
au FileType java setlocal errorformat=[ERROR]\ %f:[%l\\,%v]\ %m
au FileType gitconfig setlocal noexpandtab
au FileType crontab setlocal nowritebackup
au FileType mail setlocal spell
au FileType bindzone setlocal noexpandtab ts=8 sts=8 sw=8

au BufWritePost $CONF_SOURCE/templates/* call ConfApply(expand('%:p'))

function! ConfApply(name)
  let l:rel = substitute(a:name, "^".expand($CONF_SOURCE."/templates/"), "", "")
  silent execute "!conf apply " . l:rel | execute "redraw!"
endfunction

let g:colorizer_auto_filetype=''
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>
noremap ; :
nmap <C-p> :FZF<CR>
" temporary workaround for https://github.com/vim/vim/issues/4738
nmap gx yiW:!open <cWORD><CR> <C-r>" & <CR><CR>
