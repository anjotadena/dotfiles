set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)

set encoding=utf-8
set number relativenumber
set scrolloff=7
set backspace=indent,eol,start
set fileformat=unix

set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"

let mapleader = ' '

" ----------------------------------
"  PLUGINS
call plug#begin("~/.vim/plugged")
  "Plugin Section
   Plug 'morhetz/gruvbox'
   Plug 'dracula/vim'
   Plug 'ryanoasis/vim-devicons'
   Plug 'SirVer/ultisnips'
   Plug 'honza/vim-snippets'
   Plug 'scrooloose/nerdtree'
   Plug 'preservim/nerdcommenter'
   Plug 'mhinz/vim-startify'
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'jiangmiao/auto-pairs'
   Plug 'norcalli/nvim-colorizer.lua'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Color schemes
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
" colorscheme dracula
colorscheme gruvbox

" Open new split panes to right and below
set splitright
set splitbelow

" Open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>

" copies pwd to clipboard by pressing yf
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif


let g:airline_theme='gruvbox'

lua require 'colorizer'.setup()

" NERDCommenter
nmap <C-_> <Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" NERDTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <F2> :NERDTreeToggle<CR>

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#framemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>

"Ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/utlisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
