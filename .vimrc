set nocompatible
filetype off
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ethanling/vim-material-custom'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.tsx,*.ts,*.svelte"

set termguicolors

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set t_Co=256

set background=dark

let g:palenight_color_overrides = {
\    'black': { 'gui': '#00000000', "cterm": "0", "cterm16": "0" },
\}

colorscheme palenight

set cursorline

let g:airline_theme='transparent'
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#branch#enabled = 1 
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_warning = '' 
let g:airline_section_y = '' 
let g:airline_section_x = '' 
set laststatus=2


set noswapfile
set nobackup
set nowrap
set number
set cursorline
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab
set shiftround
set autoindent
set smartindent
filetype plugin indent on 
set backspace=indent,eol,start
syntax on

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 0
let NERDTreeMinimalUI = 1 
let NERDTreeDirArrows = 1 
let NERDTreeShowHidden = 1
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeRespectWildIgnore=1

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

" Emmet
let g:user_emmet_leader_key=','

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

"CoC config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
