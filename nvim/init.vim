set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
" Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

call plug#end()

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

set cindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set smarttab

set nu
set mouse=a
set bs=2
set smartcase

set showcmd
set autowrite
set autoread

" hybrid line numbers
set number relativenumber
set showmatch

set nowrap
set comments=sl:/*,mb:\ *,elx:\ */
set timeoutlen=1000
set ttimeoutlen=0

let g:seoul256_background = 234
colo seoul256
set background=dark
" set t_Co=256
" colorscheme gruvbox

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nmap <leader>y ggVG"+y''

filetype on
filetype indent on
set mp=g++\ -O2\ -Wall\ --std=c++17\ -Wno-unused-result\ %:r.cpp\ -o\ %:r
nmap <F2> :vs %:r.in <CR>
nmap <F3> :!time ./%:r < %:r.in <CR>
autocmd filetype cpp nnoremap <F4> :w <CR> :make<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> :make <bar> :!time ./%:r < %:r.in <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python3 %:r.py < %:r.in <CR>
