syntax on

colorscheme retrobox

set autoindent
set autoread
set background=dark
set breakindent
set colorcolumn=120
set clipboard=autoselectplus
set confirm
set cursorline
set expandtab
set hlsearch
set incsearch
set list
set listchars=tab» ,trail·
set mouse=a
set number
set ruler
set scrolloff=8
set sidescrolloff=8
set signcolumn=auto:4
set shiftwidth=4
set shortmess+=I
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set termguicolors
set textauto
set timeoutlen=280

highlight CursorLine   cterm=NONE
highlight CursorLineNr cterm=NONE

call plug#begin()

Plug 'wakatime/vim-wakatime'

call plug#end()
