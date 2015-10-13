let mapleader = " "
set nocompatible              " be iMproved, required
filetype off                  " required


let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <S-Tab> <

nnoremap <leader>h :tabp<CR>
nnoremap <leader>l :tabn<CR>



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'phildawes/racer'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'timonv/vim-cargo'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'The-NERD-Commenter'
"Plugin 'lervag/vimtex'
"Plugin 'ying17zi/vim-live-latex-preview'

call vundle#end()            " required
filetype plugin indent on    " requird

set hidden
let g:racer_cmd = "/home/scott/Programming/Rust/racer/target/release/racer"
let $RUST_SRC_PATH="/usr/local/src/rust/src"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set number
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeToggle="<F2>"
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

au BufNewFile,BufRead *.rs set filetype=rust

set t_Co=256

autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer = 'evince' 
nmap <leader>p :LLPStartPreview<cr>
nnoremap <leader>i i_<Esc>r
nnoremap <leader>a a_<Esc>r

nnoremap <C-l> <C-Right>
nnoremap <C-h> <C-Left>
inoremap <C-l> <C-Right>
inoremap <C-h> <C-Left>

set foldenable          " enable folding
set foldmethod=indent
set background=dark

set cursorline
set wildmenu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldlevelstart=10   " open most folds by default

nnoremap <leader>f za

" move vertically by visual line
nnoremap j gj
nnoremap k gk

colorscheme lucius 

" vim:foldmethod=marker:foldlevel=0
