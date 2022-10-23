let mapleader=","

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
set laststatus=2
set vb

set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
"
" ----------------------------------
"  PLUGINS
call plug#begin("~/.vim/plugged")
  "Plugin Section
   Plug 'morhetz/gruvbox'
   Plug 'dracula/vim'
   Plug 'ryanoasis/vim-devicons'
   Plug 'honza/vim-snippets'
   Plug 'scrooloose/nerdtree'
   Plug 'preservim/nerdcommenter'
   Plug 'mhinz/vim-startify'
   Plug 'jiangmiao/auto-pairs'
   Plug 'norcalli/nvim-colorizer.lua'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'tpope/vim-commentary'
   Plug 'airblade/vim-gitgutter'
   Plug 'mkitt/tabline.vim'
   Plug 'ctrlpvim/ctrlp.vim'

   " GO
   Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
   Plug 'neoclide/coc.nvim', { 'branch': 'release' }
   Plug 'SirVer/ultisnips'
   
   " Theme
   Plug 'NLKNguyen/papercolor-theme'   
call plug#end()

" Color schemes
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
" colorscheme dracula
" colorscheme gruvbox
set background=dark
colorscheme PaperColor

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

set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git  ls-files -co --exclude-standard']

" vim-gitgutter
set updatetime=500

" GoLang configuration
"-- vim-go specific configuration

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>t <Plug>(go-test)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd FileType go setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*'.&commentstring[0]

let g:go_list_type = "quickfix"    " error lists are of type quickfix
let g:go_fmt_command = "goimports" " automatically format and rewrite imports
let g:go_auto_sameids = 1          " highlight matching identifiers

"-- vim-go specific configuration (END)

"-- coc.nvim specific configuration

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"-- coc.nvim specific configuration (END)

