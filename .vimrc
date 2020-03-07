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
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'jiangmiao/auto-pairs'
Plugin 'hzchirs/vim-material'
Plugin 'alvan/vim-closetag'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'leafOfTree/vim-svelte-plugin'

call vundle#end()
filetype plugin indent on 
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js,*.tsx,*.ts,*.svelte"

if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set t_Co=256
syntax on
colorscheme minimalist


let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

hi Normal guibg=NONE ctermbg=NONE

set number
set cursorline
set smarttab
"set cindent
set shiftwidth=4
set tabstop=4
syntax on
hi CursorLine term=bold cterm=bold guibg=Grey40


map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


set backspace=indent,eol,start


