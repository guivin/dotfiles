"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
Plugin 'majutsushi/tagbar'
Plugin 'lilydjwg/colorizer'
Plugin 'godlygeek/tabular'
Plugin 'sheerun/vim-polyglot'
Plugin 'suan/vim-instant-markdown'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

"" Better-whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠ '
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
let g:syntastic_check_on_wq = 0
let g:ale_linters= {
\ 'go': ['golint', 'govet', 'errcheck'],
\ 'json': ['jsonlint'],
\ 'python': ['flake8'],
\ 'sh': ['shellcheck', 'sh'],
\ 'yaml': ['yamllint']
\ }
nmap <silent> <leader>a <Plug>(ale_next_wrap)
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_check_on_open = 0

"" NerdTree
" Open if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Start if open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Map key to open
map <C-n> :NERDTreeToggle<CR>
" Change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf-8 as standard encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use Improved
set nocompatible

" More powerful backspacing
set backspace=2

" Set how many lines of history VIM has to remember
set history=500

" Enable filetype detection
filetype on

" Enable filetype plugins
filetype plugin on
filetype indent on

" Use the OS clipboard by default
set clipboard=unnamed

" Optimize for fast terminal connections
set ttyfast

" Disable backup
set nobackup nowritebackup noswapfile

" Don't add empty newlines at the end of files
set binary noeol

" Use vertical diff
set diffopt+=vertical

" Respect modeline in files
set modeline modelines=4

" Ignore case of searches
set ignorecase

" Always show status line
" set laststatus=2

" Enable mouse in all modes
set mouse=a

" Disable error bells
set noerrorbells novisualbell t_vb= tm=500

" Don't reset cursor to start a line when moving around
set nostartofline

" Don't show the intro message when starting Vim
set shortmess=atI

" Don't redraw while executing macros
set lazyredraw

" For regular expressions turn magic on
set magic

" Comments
autocmd Filetype cfg setlocal commentstring=#\ %s
autocmd Filetype sql setlocal commentstring=--\ %s

" eyaml recognized as yaml
autocmd BufNewFile,BufRead *.eyaml setfiletype yaml

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2 tabstop=2 softtabstop=2

" Configure backspaces
set backspace=indent,eol,start
set whichwrap=<,>,h,l

" Set auto indent
set ai

" Set smart indent
set si

" Wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Dark background
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
end

if has('autocmd')
    augroup coloroverride
        autocmd!
        autocmd ColorScheme * highlight LineNr  ctermfg=DarkGrey guifg=DarkGrey " Override LineNr
        autocmd ColorScheme * highlight CursorLineNr  ctermfg=White guifg=White " Override CursorLineNr
    augroup END
endif
silent! colorscheme eldar " Custom color scheme

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

" Enable line numbers
set number nu

" Rule current line
set ruler

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the partial command as it is being typed
set showcmd

" Show matching backets when text indicator is over them
set showmatch

" How many tenths of second to blink when matching brackets
set mat=2

" Set the command window height to 2 to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Open new split panes to right and bottow which feels more natural
set splitbelow splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if system('uname') =~ "Darwin"
  set rtp+=/opt/homebrew/opt/fzf
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = " "
let g:mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

" Fast quit
nnoremap <leader>q :qa<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Resize vsplit
nmap <C-v> :vertical resize +5
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

" Execute current file
nnoremap <leader>r :!%:p

au FileType go map <leader>r :!go run %<CR>

" tab mapping
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
