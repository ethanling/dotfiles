set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'dikiaap/minimalist'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'

call vundle#end()
filetype plugin indent on 
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.tsx,*.ts,*.svelte"


set t_Co=256
set termguicolors

colorscheme minimalist
set background=dark

let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

hi Normal guibg=NONE ctermbg=NONE
syntax on
set noswapfile
set nobackup
set nowrap
set number
set cursorline
set smarttab
set shiftwidth=4
set tabstop=4
syntax on
hi CursorLine term=bold cterm=bold

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 0
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 
let NERDTreeShowHidden = 1
hi VertSplit guibg=NONE
hi VertSplit guifg=black


let mapleader= " "

map - <C-W>-
map + <C-W>+
" Window Switching
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader><leader> V

set backspace=indent,eol,start
