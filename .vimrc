syntax on

let g:mapleader = ' '

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
set laststatus=2
set list
set listchars=tab:>-,trail:-
set mouse=a
set number
set ruler
set scrolloff=8
set sidescrolloff=8
set signcolumn=auto
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

noremap j gj
noremap k gk

noremap <leader>y "+y
noremap <leader>p "+p

nnoremap <Esc> <Cmd>nohlsearch<CR>

nnoremap <leader>w <Cmd>w<CR>
nnoremap <leader>q <Cmd>q<CR>

call plug#begin()

Plug 'wakatime/vim-wakatime'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'

call plug#end()

colorscheme gruvbox

let g:airline_section_z = '%l/%L:%c'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
