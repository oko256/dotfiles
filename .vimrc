set nocompatible
let mapleader = ','

syntax on
filetype on
filetype plugin on
filetype indent on

" Set fonts if running gvim
if has('gui_running')
    if has('win32')
        set guifont=Consolas:h10
    elseif has('unix')
        set guifont=Input\ Mono\ Condensed\\\,\ Condensed\ 12
    endif
    " Disable cursor blinking
    set guicursor+=a:blinkon0
endif

" We usually want UTF-8
set encoding=utf8

" Protect changes between writes
set swapfile
set directory^=$HOME/.vim/swap//
" Protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" Use rename-and-write-new method whenever safe
set backupcopy=auto
" Patch required to honor double slash at end
if has("patch-8.1.0251")
    " Consolidate the writebackups, they usually get deleted anyway
    set backupdir^=$HOME/.vim/backup//
endif
" Persist undo tree per file
set undofile
set undodir^=$HOME/.vim/undo//

" Default indents to 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Change indents for code a bit
set cino+=(s,m1
" Line numbers
set number
" Use spaces instead of TABs
set expandtab
" Highlight all search matches
set hlsearch
" Search incrementally while inputting
set incsearch
" Automatically change working directory
set autochdir
" Read modeline from opened file
set modeline
" Show partial command input on screen
set showcmd
" Ignore case on search except when caps is used
set ignorecase
set smartcase
" Disable bells
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=
" Allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start
" Enable auto and smart indentation
set autoindent
set smartindent
" Scroll window before cursor hits the last line
set scrolloff=3
" Longer command history
set history=100
" Allow more tabs
set tabpagemax=50
" Highlight the line where the cursor is
set cursorline
" Enable this if scrolling is very slow
"set lazyredraw
" Vertical line as vertical separator
set fillchars+=vert:│
" No delay when switching from insert to normal using esc
set timeoutlen=1000 ttimeoutlen=0
" Do not use double spaces when joining paragraphs etc.
set nojoinspaces
" Allow hidden buffers
set hidden
" Printing options
set printoptions=paper:A4,number:y

set termguicolors
set background=dark
colorscheme lunaperche

" Clear search highlights using <leader>n
nnoremap <Leader>n :noh<CR>
" Navigate between splits with shift+arrows
nnoremap <silent> <S-Down> <c-w>j
nnoremap <silent> <S-Up> <c-w>k
nnoremap <silent> <S-Right> <c-w>l
nnoremap <silent> <S-Left> <c-w>h
" Also in terminal splits
tnoremap <silent> <S-Down> <c-w>j
tnoremap <silent> <S-Up> <c-w>k
tnoremap <silent> <S-Right> <c-w>l
tnoremap <silent> <S-Left> <c-w>h
