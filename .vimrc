inoremap jk <ESC>

nnoremap <SPACE> <Nop>
nnoremap <C-D> <C-D>zz
nnoremap <C-U> <C-U>zz
nnoremap <C-n> :NERDTreeToggle<CR>

let mapleader = ";"

" Setting for vim
syntax on
set number relativenumber
set nu rnu

set noswapfile
set hlsearch
set ignorecase
set incsearch

set shiftwidth=4
set tabstop=4

set cursorline
set mouse=a

set foldmethod=indent
set foldlevel=99

" Plugins

let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree'

" Language support
Plug 'JuliaEditorSupport/julia-vim'

" Asynchronous Lint Engine
Plug 'dense-analysis/ale'

" coc.nvim for code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-julia'

call plug#end()

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set rtp+=/usr/local/opt/fzf

colorscheme onedark
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey


" Enable ALE for Julia
let g:ale_linters = {
    \ 'julia': ['language-server'],
    \}

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

