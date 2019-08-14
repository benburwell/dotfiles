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

" here is some stuff
hi! ColorColumn           ctermfg=NONE     ctermbg=DarkBlue cterm=NONE
hi! Comment               ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! Conceal               ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! Constant              ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! CursorColumn          ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi! CursorLine            ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! CursorLineConceal     ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! CursorLineNr          ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! DiffAdd               ctermfg=Black    ctermbg=Yellow   cterm=NONE
hi! DiffChange            ctermfg=Blue     ctermbg=Yellow   cterm=NONE
hi! DiffText              ctermfg=White    ctermbg=Yellow   cterm=NONE
hi! Directory             ctermfg=Blue     ctermbg=NONE     cterm=NONE
hi! Error                 ctermfg=Black    ctermbg=Red      cterm=NONE
hi! ErrorMsg              ctermfg=Black    ctermbg=Red      cterm=standout
hi! FoldColumn            ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi! Folded                ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! Function              ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! GitGutterAdd          ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! GitGutterChange       ctermfg=Blue     ctermbg=NONE     cterm=NONE
hi! GitGutterChangeDelete ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! GitGutterDelete       ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! Identifier            ctermfg=Blue     ctermbg=NONE     cterm=NONE
hi! Ignore                ctermfg=NONE     ctermbg=NONE     cterm=NONE
hi! LineNr                ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! LongLineWarning       ctermfg=NONE     ctermbg=NONE     cterm=underline
hi! MatchParen            ctermfg=White    ctermbg=NONE     cterm=underline
hi! ModeMsg               ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! MoreMsg               ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! NonText               ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! Normal                ctermfg=White    ctermbg=NONE     term=NONE
hi! Operator              ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! Pmenu                 ctermfg=Black    ctermbg=Yellow   cterm=NONE
hi! PmenuSel              ctermfg=Black    ctermbg=Yellow   cterm=reverse
hi! PreProc               ctermfg=Red      ctermbg=NONE     cterm=NONE
hi! Question              ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! Search                ctermfg=Black    ctermbg=Cyan     cterm=NONE
hi! SignColumn            ctermfg=NONE     ctermbg=Yellow   cterm=NONE
hi! Special               ctermfg=Red      ctermbg=NONE     cterm=NONE
hi! SpecialKey            ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! SpellBad              ctermfg=Red      ctermbg=NONE     cterm=underline
hi! SpellCap              ctermfg=Red      ctermbg=NONE     cterm=underline
hi! SpellLocal            ctermfg=Yellow   ctermbg=NONE     cterm=underline
hi! SpellRare             ctermfg=Magenta  ctermbg=NONE     cterm=underline
hi! Statement             ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! StatusLine            ctermfg=Blue     ctermbg=NONE     cterm=bold
hi! StatusLineNC          ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! String                ctermfg=Cyan     ctermbg=NONE     cterm=NONE
hi! Structure             ctermfg=Red      ctermbg=NONE     cterm=NONE
hi! TabLine               ctermfg=DarkBlue ctermbg=Black    cterm=NONE
hi! TabLineFill           ctermfg=DarkBlue ctermbg=Black    cterm=NONE
hi! Title                 ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! Todo                  ctermfg=Yellow   ctermbg=NONE     cterm=NONE
hi! Type                  ctermfg=Blue     ctermbg=NONE     cterm=NONE
hi! Underlined            ctermfg=Blue     ctermbg=NONE     cterm=underline
hi! VertSplit             ctermfg=DarkBlue ctermbg=NONE     cterm=NONE
hi! Visual                ctermfg=Black    ctermbg=Yellow   cterm=NONE
hi! WarningMsg            ctermfg=Red      ctermbg=NONE     cterm=NONE
hi! WildMenu              ctermfg=Black    ctermbg=Yellow   cterm=NONE
hi! qfLineNr              ctermfg=Yellow   ctermbg=NONE     cterm=NONE

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
  silent execute "!conf apply " . l:rel
endfunction

let g:colorizer_auto_filetype=''
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

nnoremap <silent> <Esc><Esc> <Esc>:noh<CR><Esc>
noremap ; :
nmap <C-p> :FZF<CR>
