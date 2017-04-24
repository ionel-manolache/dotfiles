set nocompatible

if has("win32")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

filetype off            " disable filetype for now

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternately, pass a path where Vundle should install plugins
"    call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" I've commented the plugins that I don't actually use. Will refine the list later
" NERDTre
" Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" tabs for NERDTree
" Plugin 'jistr/vim-nerdtree-tabs'

" syntastic - syntax highlighter
" Plugin 'scrooloose/syntastic'

" github integration (?) -- TODO Check this plugin and remove it if not used
" Plugin 'junegunn/vim-github-dashboard'

" git integration - NOTE and TODO check tpope's plugins and test them
" Plugin 'tpope/vim-fugitive'

" do stuff surrounding stuff
Plugin 'tpope/vim-surround'

" sensible defaults (?) that should be ok for everybody
Plugin 'tpope/vim-sensible'

" graphical undo
" Plugin 'vim-scripts/gundo'

" taglist: requires ctags
" Plugin 'vim-scripts/taglist.vim'

" yankring: allows selection of text to paste from previous yanks
" Plugin 'vim-scripts/YankRing.vim'

" ?????
" Plugin 'vim-scripts/a.vim'

" TaskList - make a TODO-like list (maybe check out aaronbieber/vim-quicktask
" Plugin 'vim-scripts/TaskList.vim'
" Plugin 'aaronbieber/vim-quicktask' " <-- this one should be better... I should check them out

" comment any kind of code in a couple of key presses
" Plugin 'tomtom/tcomment_vim'

" lean & mean status/tabline for vim that's light as air
" Plugin 'bling/vim-airline'

" easy search and open files from current root directory
" Plugin 'kien/ctrlp.vim'

" colorize parentheses, braces, curly braces, etc
Plugin 'kien/rainbow_parentheses.vim'

" incremental search, highlights the current match as you type
" Plugin 'haya14busa/incsearch.vim'

" ack integration : TODO: I should learn some ack
" Plugin 'mileszs/ack.vim'

" shows visual guides for code/text indents
" Plugin 'nathanaelkane/vim-indent-guides'

" massive collection of color schemes : TODO: maybe I should check each of them out and then use just that one
" Plugin 'flazz/vim-colorschemes'

" json syntax highlighting
" Plugin 'elzr/vim-json'

" something with numbers ??
" Plugin 'myusuf3/numbers.vim

" knows how to display markdown language
Plugin 'hallison/vim-markdown'

" scratchpad
" Plugin 'mtth/scratch.vim'

" snippets
" Plugin 'SirVer/ultisnips'

" exchange variables (??)
" Plugin 'tommcdo/vim-exchange'

" atom dark color scheme
Plugin 'gosukiwi/vim-atom-dark'

" todo.txt support (??)
Plugin 'elentok/todo.vim'

call vundle#end()     " required

" Brief Vundle help:
" :PluginList		- lists configured plugins
" :PluginInstall	- installs plugins; append '!' to update or just :PluginUpdate
" :PluginSeaqrch foo    - searches for foo; append '!' to refresh local cache
" :PluginClean          - confirms removal of unused plugins; append '!' to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"

"{{{Standard
syntax on 		    " enable syntax highlighting

set tabstop=4		" number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4	" number of spaces in TAB when editing
set expandtab		" TABs are spaces
set showcmd		    " show command in bottom bar
set cursorline		" highlight current line
filetype on
filetype indent on  " load filetype specific indent files
filetype plugin on  " load filetype specific plugins
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
set history=200     " keep 200 last used commands in history
set scrolloff=5     " keep at least 5 lines above/below when scrolling
set sidescrolloff=5 " keep at least 5 columns left/right when scrolling
set cmdheight=2     " command line 2 lines high
set undolevels=1000 " 1000 undos
set updatecount=100 " switch every 100 chars
set complete=.,w,b,u,U,t,i,d " ???
set noerrorbells    " don't make sounds from the computer's 'bell'
set visualbell      " make visual signal instead

set path+=**        " add current dir and all subdirs to path (for fuzzy file open functionality)

set modelines=0     " there seems to be an exploit using modelines...
"}}}

"{{{Remap : to ;
nore ; :
nore : ;
"}}}

"{{{Searching
set incsearch       " incremental search
set hlsearch        " highlight matches
"}}}

"{{{Folding
set foldenable      " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested folds max
set foldmethod=marker   " fold by marker (??) TODO: check if we can fold using something else (like maybe funciton bodies in c++)
"}}}

" highlight last inserted text
nnoremap gV `[v`]

let mapleader=","       " leader is comma instead of /

" jk is escape
inoremap jk <esc>

" save session TODO: check this out, and maybe make it work
" nnoremap <leader>s :mksession<CR> 

" open ag.vim (TODO: `TF is this??)
" nnoremap <leader>a :Ag


"{{{Backup
set nobackup        " TODO: What does this do?
set noswapfile      " TODO: What does this do?
"}}}


set laststatus=2    " ???? TODO: what's this?
set stl=%f\ %m\ %r\ [%{&ff}]\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

colorscheme atom-dark

set background=dark


" Global stuff

set termencoding=utf-8
set encoding=utf-8

set guifont=Consolas:h10:cANSI

set wrapscan        " search scan wraps lines

set ignorecase      " Ignore case when search item is all lowercase
set smartcase       " Recognize uppercase when intended

set shellslash      " set the forward slash to be the slash of note. Backslash sucks

set backspace=indent,eol,start " allow backspacing over indent, eol, and the start of an insert

set hidden          " allows unsaved buffers to be put in background

set cpoptions=ces$  " 'cw' and like commands show an $ at the end, instead of just deleting the text and replacing it

set showmode        " show current mode

set mousehide       " hide mouse pointer when typing

set guioptions=ac   " TODO: What does this do??

set timeoutlen=500  " TODO: What does this do too??

set number		    " show line numbers
set relativenumber  " show line numbers relative to current line

set undofile        " save undos in a hidden file, then next time we can undo previous changes

" these commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set virtualedit=all " allow the cursor to go in to 'invalid' places

"{{{
"for c++ completion (ctags)
set tags+=~/vimtags/cpp
set tags+=~/vimtags/qt5
set tags+=~/vimtags/wowapp
" build tags of your own project with ctrl-f12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete ????? TODO: Check this out

"}}}

"{{{ from vimbits.com
"reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

"easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"automatically reload vimrc when it's saved (?? shold I really do this??)
" au BufWritePost _vimrc so ~/_vimrc

" move between visual lines, not file lines:
nnoremap j gj
nnoremap k gk

" disable F1 key for help
inoremap <F1> <Esc>
nnoremap <F1> <Esc>
vnoremap <F1> <Esc>

"Select all text
map <leader>a ggVG

"Map Q to repeat the last recorded macro
map Q @@

"Toggle search highlights
nnoremap <space> :set hlsearch! hlsearch?<CR>

"Insert blank lines without going into insert mode
nmap t o<Esc>k
nmap T O<Esc>j

" Run python code from vim
" map <F5> :w <CR>!clear <CR>:!python % <CR>

"Show text limit line
set colorcolumn=100
hi ColorColumn ctermbg=red ctermfg=white guibg=#592929

"Quickly open/source .vimrc/.gvimrc files
nnoremap <leader>vv :e $MYVIMRC<CR>
nnoremap <leader>ss :source $MYVIMRC<Bar><CR>

"list buffers and switch to buffer quickly
nmap <leader>b :ls<CR>:buffer<space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

"update open files when changed externally
set autoread

" If I'm at work, I want to start working
if has("win32")
    :cd F:/git/talk_gui
else
    :cd ~/git/talk_gui
endif

" Start NERDTree by default
" autocmd VimEnter * NerdTree

"Move selection from previously opened NERDTree
" autocmd VimEnter * wincmd p

" maximize window when first opened (Ms Windows only)
if has("win32")
    au GUIEnter * simalt ~x
endif

"save on focus lost
au FocusLost * :wa

"}}}

"show matching brackets when text indicator is over them
set showmatch

"set ,nn to toggle NERDTree
" nnoremap <leader>nn :NERDTreeToggle<CR>

" c/c++ set F4 to switch between .c/.cpp and .h files.
nnoremap <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"}}}


