"          __                    
"   .--.--|__.--------.----.----.
"  _|  |  |  |        |   _|  __|
" |__\___/|__|__|__|__|__| |____|
" These are some sick VIM configs. 


"
" A P P E A R A N C E
"

colorscheme desert
set hlsearch
set expandtab
set tabstop=4
set autoindent
set ignorecase
set smartcase
set cursorline
set noerrorbells
set visualbell

"These seeems to slow donw vim on startup
"set background=dark
"set relativenumber

"
" P L U G I N S
"

" Plugin Manager: vim-plug
" https://github.com/junegunn/vim-plug

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

" Could not figure out with linter to use for C/C++
" Plug 'vim-syntastic/syntastic'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Changes leader from '\' to ','
let mapleader = ","

"Shortcut for nerdtree
map <leader>nt :NERDTreeToggle<cr>
