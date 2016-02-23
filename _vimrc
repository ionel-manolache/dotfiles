

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


set nocompatible        " disable vi-compatibility
filetype off            " disable filetype for now

" set the runtime path to include Vundle and initialize
set rtp+=~/Vim/vimfiles/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree:
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" syntastic - syntax highlighter
Plugin 'scrooloose/syntastic'

" github integration (?)
Plugin 'junegunn/vim-github-dashboard'

" git integration
Plugin 'tpope/vim-fugitive'

" do stuff surrounding stuff
Plugin 'tpope/vim-surround'

" sensible defaults that should be ok for everybody
Plugin 'tpope/vim-sensible'

" graphical undo
Plugin 'vim-scripts/gundo'

" taglist: requires ctags...
"Plugin 'vim-scripts/taglist.vim'

" yankring: allows selection of text to paste from previous yanks
Plugin 'vim-scripts/YankRing.vim'

" ?
Plugin 'vim-scripts/a.vim'

" TaskList: make a TODO-like list
Plugin 'vim-scripts/TaskList.vim'

" comment any kind of code in a couple of key presses
Plugin 'tomtom/tcomment_vim'

" ?
Plugin 'bling/vim-airline'

" easy search and open files from current root directory
Plugin 'kien/ctrlp.vim'

" colorize parentheses, braces, curly braces, etc
Plugin 'kien/rainbow_parentheses.vim'

" incremental search, highlights the current match as you type
Plugin 'haya14busa/incsearch.vim'

" ack integration
Plugin 'mileszs/ack.vim'

" shows visual guides for code/text indents
Plugin 'nathanaelkane/vim-indent-guides'

" massive collection of color schemes
Plugin 'flazz/vim-colorschemes'

" json syntax highlighting ??
Plugin 'elzr/vim-json'

" tabs for NERDTree
Plugin 'jistr/vim-nerdtree-tabs'

" something with numbers ??
Plugin 'myusuf3/numbers.vim'

" knows how to display markdown language
Plugin 'hallison/vim-markdown'

" scratchpad
Plugin 'mtth/scratch.vim'   

" snippets
Plugin 'SirVer/ultisnips'

" exchange variables
Plugin 'tommcdo/vim-exchange'


" atom-dark color scheme
Plugin 'gosukiwi/vim-atom-dark'

" todo.txt support
Plugin 'elentok/todo.vim'

call vundle#end()   " required

" Brief Vundle help:
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"

"{{{Standard
syntax on  			    " enable syntax processing
set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4
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

set modelines=0     " there seems to be an expoit using modelines...
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


" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma instead of \

" jj is escape
inoremap jj <esc>

" save session
" nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag



"{{{ Backup
set nobackup
set noswapfile
"}}}


set laststatus=2
"set statusline=%P%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set stl=%f\ %m\ %r\ [%{&ff}]\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

colorscheme atom-dark

set background=dark


"--------------------------------------
" Global Stuff
"--------------------------------------

set termencoding=utf-8
set encoding=utf-8

" Set Consolas font
set guifont=Consolas:h10:cANSI,Courier\ New:h10:cANSI

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
set backspace=indent,eol,start

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

" show relative line numbers
set relativenumber

" save undo's from previous sessions!!
set undofile

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Allow the cursor to go in to 'invalid' places
set virtualedit=all

"{{{
"For C++ completion (ctags)
set tags+=~/vimtags/cpp
set tags+=~/vimtags/qt5
set tags+=~/vimtags/wowapp
"build tags of your own project with ctrl-f12
map <C-F12> :!"C:\ctags\ctags" -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after . (dot)
let OmniCpp_MayCOmpleteArrow = 1 "autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"}}}

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

" move between visual lines, not file lines:
nnoremap j gj
nnoremap k gk

" disable F1 key for help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Select all text
map <Leader>a ggVG

"Map Q to repeat the last recorded macro
map Q @@

"Toggle search highlights
nnoremap <space> :set hlsearch! hlsearch?<CR>

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

" Save on focus lost!
au FocusLost * :wa

"}}}

"Show matching brackets when text indicator is over them
set showmatch

" Set ,nn to toggle NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>

" c/c++ set F4 to switch between .c/.cpp and .h files.
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
