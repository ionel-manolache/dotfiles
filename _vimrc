
set nocompatible

if has("win32")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif


filetype off

"call pathogen#infect()
"call pathogen#helptags()


call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'junegunn/vim-github-dashboard'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/gundo'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/TaskList.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'elzr/vim-json'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'myusuf3/numbers.vim'
Plug 'hallison/vim-markdown'

call plug#end()


"{{{Standard
set nocompatible        " disable vi-compatibility
syntax on  			    " enable syntax processing
set tabstop=4			" number of visual spaces per TAB
set softtabstop=4 		" number of spaces in tab when editing
set	expandtab			" tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype on
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype-specific plugins
set wildmenu            " visua autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set history=200         " keep 200 last used commands in history
set scrolloff=5         " keep at least 5 lines above/below
set sidescrolloff=5     " keep at least 5 columns left/right
set cmdheight=2         " command line 2 lines high
set undolevels=1000     " 1000 undos
set updatecount=100     " switch every 100 chars
set complete=.,w,b,u,U,t,i,d
set noerrorbells
set visualbell
"}}}

"{{{Remap : to ;
nore ; :
nore : ;
"}}}


"{{{Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
"}}}

"{{{Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=marker   " fold by marker
"}}}

"{{{Movement (custom)
" move to begining/end of line
nnoremap H ^
nnoremap L $

" ^/$ to do nothing
nnoremap $ <nop>
nnoremap ^ <nop>
"}}}


" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma instead of \

" jk is escape
inoremap jj <esc>
" nnoremap JJJJ <esc>

" save session
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

if has("win32")
"{{{CtrlP settings
set runtimepath^="C:\Program Files (x86)\Vim\vimfiles\bundle\ctrlp.vim"
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
"}}}
endif




"{{{ Backup
set nobackup
set noswapfile
"}}}


set laststatus=2
"set statusline=%P%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

"colorscheme ir_black
"colorscheme koehler
"colorscheme torte
colorscheme mustang

set background=dark


"--------------------------------------
" Global Stuff
"--------------------------------------

if has("win32")
" Set Consolas font
set guifont=Consolas:h10:cANSI,Courier\ New:h10:cANSI
endif

" Tabstops are 4 spaces
set shiftwidth=4

" Set the search scan to wrap lines
set wrapscan

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" set the forward slash to be the slash of note. Backslashes suck
set shellslash

" Make command line two lines high
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" set the gui options the way I like
set guioptions=ac

" I don't know what this does
set timeoutlen=500

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

"{{{ From vimbits.com
"reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"automatically reload vimrc when it's saved
"au BufWritePost _vimrc so ~/_vimrc

"Select all text
map <Leader>a ggVG

"Map Q to repeat the last recorded macro
map Q @@

"Resize splits when the window is resized
au VimResized * exe "normal! \<C-w>="

"Toggle search highlights
noremap <space> :set hlsearch! hlsearch?<CR>

"Insert blank lines without going into insert mode
nmap t o<Esc>k
nmap T O<Esc>j

" Run Python code from vim
" map <f5> :w <CR>!clear <CR>:!python % <CR>

"Show text limit line
if (v:version >= 703)
    set colorcolumn=100
    hi ColorColumn ctermbg=red ctermfg=white guibg=#592929
endif

"Quickly open/source .vimrc/.gvimrc files
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<Bar><CR>

"List buffers and switch to buffer quickly
nmap <leader>b :ls<CR>:buffer<Space>

"Update open files when changed externally
set autoread

" if I'm at work, on windows, I want to start working
if has("win32")
" go to D:\Git_Woow\talk_gui by default"
:cd D:\Git_Woow\talk_gui
endif

" Start NERDTree by default
autocmd VimEnter * NERDTree

" Move selection from previously opened NERDTree
autocmd VimEnter * wincmd p

" Maximize window when first opened (THIS IS FOR WINDOWS ONLY)
au GUIEnter * simalt ~x

"}}}

"Show matching brackets when text indicator is over them
set showmatch


