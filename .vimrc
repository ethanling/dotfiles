set termguicolors
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Vundle/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'ethanling/vim-material-custom'
Plugin 'sheerun/vim-polyglot'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
Plugin 'preservim/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call vundle#end()
filetype plugin indent on 
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.tsx,*.ts,*.svelte"

"colorscheme material 
set background=dark

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1

colorscheme tokyonight

let g:airline_theme='transparent'
let g:airline#extensions#tabline#enabled = 1

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

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 0
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 
let NERDTreeShowHidden = 1
"hi VertSplit guibg=NONE
"hi VertSplit guifg=black
let mapleader= " "

map - <C-W>-
map + <C-W>+
" Window Switching
nmap <leader>h :wincmd h<CR>
nmap <leader>j :wincmd j<CR>
nmap <leader>k :wincmd k<CR>
nmap <leader>l :wincmd l<CR>
nmap <leader><leader> V

" Emmet
let g:user_emmet_leader_key=','

set backspace=indent,eol,start
