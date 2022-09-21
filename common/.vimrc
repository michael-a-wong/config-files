"          __                    
"   .--.--|__.--------.----.----.
"  _|  |  |  |        |   _|  __|
" |__\___/|__|__|__|__|__| |____|
" These are some sick VIM configs. 
"

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
set number
set laststatus=2
set noshowmode

"show tabs as <---"
set list
set listchars=tab:>-


if !has('gui_running')
    set t_Co=256
endif

"These seeems to slow donw vim on startup
"set background=dark
"set relativenumber

"
" P L U G I N S
"

" Plugin Manager: vim-plug
" https://github.com/junegunn/vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
silent!call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}

Plug 'itchyny/lightline.vim'

Plug 'frazrepo/vim-rainbow'

Plug 'airblade/vim-gitgutter'

" Could not figure out with linter to use for C/C++
" Plug 'vim-syntastic/syntastic'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Changes leader from '\' to ','
let mapleader = ","

"Shortcut for nerdtree
map <leader>nt :NERDTreeToggle<cr>

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

set updatetime=100

