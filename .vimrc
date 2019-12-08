if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'dikiaap/minimalist'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jiangmiao/auto-pairs'
Plug 'hzchirs/vim-material'
Plug 'alvan/vim-closetag'

call plug#end()

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx,*.js"

if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set t_Co=256
syntax on
colorscheme minimalist


let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

hi Normal guibg=NONE ctermbg=NONE

set number
set cursorline
set smarttab
set cindent
set shiftwidth=4
set tabstop=4
syntax on
hi CursorLine term=bold cterm=bold guibg=Grey40


map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


set backspace=indent,eol,start


