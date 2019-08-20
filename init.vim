" We need to set these before we load the plugins
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
let g:airline#extensions#tabline#fnamemod = ':t'


" import plugins
if has('win32') || has('win64')
    source ~/AppData/Local/nvim/.plugins.vimrc
else
    source ~/.config/nvim/.plugins.vimrc
endif

" many basic options are already set by the tpope/vim-sensible plugin
" but we may override them

set nocompatible        " make vim more useful
filetype plugin on      " behaviors based on file type (plugins, syntax, etc)
syntax on
set encoding=utf-8
set number relativenumber      " enable relative line numbers
set wildmode=longest,list,full  " enable autocompletion

set wildmenu            " enhanced command completion
set backspace=indent,eol,start
set ttyfast             " optimize for fast terminal connections

set background=dark
set termguicolors       " set true terminal colors
"colorscheme gruvbox
colorscheme spacegray

function! CreateDir(path)
    if empty(glob(a:path))
        call mkdir(a:path, "p")
    endif
endfunction

" Centralize backups, swapfiles and undo history
function! CreateCustomDirs()
    let WLOCAL=""
    if has('unix')
        let WLOCAL=$HOME."/.vim"
    endif
    if has('win32') || has('win64')
        let WLOCAL=$HOME."/AppData/Local/nvim"
    endif
    let BACKUPS=WLOCAL."/backups"
    let SWAPS=WLOCAL."/swaps"
    let UNDO=WLOCAL."/undo"

    call CreateDir(BACKUPS)
    call CreateDir(SWAPS)
    call CreateDir(UNDO)

    set backupdir=BACKUPS
    set directory=SWAPS
    set undodir=UNDO
endfunction

call CreateCustomDirs()

" Don't create backups when editing files in certain directories
if has('unix')
    set backupskip=/tmp/*,/private/tmp/*
endif

if has('win32') || has('win64')
    set backupskip=C:/Temp,C:/Windows/Temp
endif

" Respect modeline in files (??)
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Always show status line
set laststatus=2

" show the cursor position
set ruler

" show the current mode
set showmode

" show the filename in the title bar
set title

set scrolloff=4
set sidescrolloff=4

set showmatch           " show matching brackets
set nojoinspaces        " prevents inserting two spaces after punctuation on a join (J)

set clipboard=unnamed   " use the os clipboard by default (on versions compiled with `+clipboard`)


set hlsearch            " highlight searches
set ignorecase          " ignore case of searches
set incsearch           " incremental search
set smartcase           " use smart case (lowercase ignores case, upper case matches exactly)
set wrapscan            " search scan wraps lines

set noerrorbells        " don't make sounds from the computer's 'bell'
set visualbell          " make visual signal instead

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set nostartofline       " do not reset cursor to start of line when moving around

set showcmd             " show the (partial) command as it is being typed

set wrap linebreak      " soft wrapping of lines

set spelllang=en_us     " set spell check language to en_us

" highlight last inserted text
nnoremap gV `[v`]

" jk is escape
inoremap jk <esc>

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open new split panes to right, bottom
set splitright splitbelow

" automatically reload vimrc when it's saved (?? should I realy do this??)
"au BufWritePost .vimrc so ~/.vimrc

" move between visual lines, not file lines:
nnoremap j gj
nnoremap k gk

" disable F1 key for help
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

" select all text
map <leader>a ggVG

" toggle search highlights
nnoremap <space> :set hlsearch! hlsearch?<CR>

" insert blank lines without going into insert mode
nmap t o<Esc>k
nmap T O<Esc>j

" show text limit line
set colorcolumn=100
hi ColorColumn ctermbg=red ctermfg=white

" quickly open/source .vimrc
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<bar><CR>


" list buffers and switch to buffer quickly
nmap <leader>b :ls<CR>:buffer<space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" update open files when changed externally
set autoread


if has("autocmd")
    au FocusLost * :wa          " save on focus lost

    " disables automatic commenting on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " C/C++ set F4 to switch between .c/.cpp and .h files
    autocmd FileType c nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.cpp,<CR>
    autocmd FileType cpp nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

    " Compile & run current file with F5
    autocmd FileType python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
    autocmd FileType c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd FileType cpp nnoremap <F5> :w <bar> exec '!g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    autocmd FileType sh nnoremap <F5> :w <bar> exec '!clear && shellcheck '.shellescape('%')<CR>

    " alternate relativenumber mode
    autocmd FocusLost * :set number
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
    autocmd BufReadPost * :set relativenumber
    autocmd BufNewFile * :set relativenumber

    autocmd BufWritePre * %s/\s\+$//e                       " strip trailing whitespace on save
    autocmd BufWritePre * retab                             " unify indentation on save
    autocmd BufRead,BufNewFile *.md,*.tex setlocal spell    " enable spell checking for certain file types

    autocmd VimEnter *.jrnl $pu=strftime('%n[%T]%n%n')
    autocmd VimEnter *.jrnl :Goyo
    autocmd VimEnter *.jrnl :Limelight
endif

